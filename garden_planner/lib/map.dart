import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  final Map<String, dynamic> gardenPlan;

  const MapScreen({super.key, required this.gardenPlan});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  bool _isLoadingLocation = false;

  @override
  void initState() {
    super.initState();
    _findAndMoveToUserLocation();
  }

  Future<void> _findAndMoveToUserLocation() async {
    setState(() => _isLoadingLocation = true);

    try {
      if (!await Geolocator.isLocationServiceEnabled()) {
        throw Exception('Location services are disabled.');
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception('Permissions are permanently denied.');
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      _mapController.move(LatLng(position.latitude, position.longitude), 18.0);

    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    } finally {
      if (mounted) {
        setState(() => _isLoadingLocation = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final String esriApiKey = dotenv.env['ESRI_API_KEY'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.gardenPlan['name']),
        backgroundColor: const Color.fromARGB(255, 96, 180, 105),
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: const MapOptions(
          initialCenter: LatLng(0, 0), // Center of the map
          initialZoom: 2.0,            // Zoomed all the way out
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://ibasemaps-api.arcgis.com/arcgis/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}?token=$esriApiKey',
            additionalOptions: const {
              'userAgent': 'com.example.gardenplanner',
            },
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _isLoadingLocation ? null : _findAndMoveToUserLocation,
        backgroundColor: const Color.fromARGB(255, 96, 180, 105),
        child: _isLoadingLocation
            ? const CircularProgressIndicator(color: Colors.white)
            : const Icon(Icons.my_location),
      ),
    );
  }
}