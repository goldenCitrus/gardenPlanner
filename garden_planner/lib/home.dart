import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameController = TextEditingController();

  List<String> _gardenPlans = [];

  void _showAddGardenDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // shape: const RoundedRectangleBorder(
          //   borderRadius: BorderRadius.zero,
          // ),
          title: const Text('Name Your New Plan'),
          content: TextField(
            controller: _nameController,
              decoration: const InputDecoration(
                hintText: "eg., Summer  '26"
              ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                String planName = _nameController.text.trim();

                if (planName.isEmpty) {

                  OverlayEntry errorToast = OverlayEntry(
                    builder: (context) => Positioned(
                      top: 60,
                      left: 20,
                      right: 20,
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                          decoration: BoxDecoration(
                            color: Colors.red, // THE RED BACKGROUND!
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            'Please enter a name for your plan!',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  );

                  // 2. Stick it onto the very top glass layer of the screen
                  Overlay.of(context).insert(errorToast);

                  // 3. Set a timer to peel it off after 2 seconds
                  Future.delayed(const Duration(seconds: 2), () {
                    errorToast.remove();
                  });

                  return;
                }
                setState(() {
                  _gardenPlans.add(planName);
                });
                _nameController.clear();
                Navigator.pop(context);
              },
              child: const Text('Submit'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
                'Garden Planner',
                style: TextStyle(
                    fontSize: 24
                  // fontWeight: FontWeight.bold,
                )
            )),
        backgroundColor: const Color.fromARGB(255, 96, 180, 105),
        foregroundColor: Colors.white,
      ),

      body: _gardenPlans.isEmpty
          ? const Center(child: Text('No plans yet. Click + to create one!'))
          : ListView.builder(
        itemCount: _gardenPlans.length,
        itemBuilder: (context, index) {
          DateTime now = DateTime.now();
          String formattedDate = '${now.month}/${now.day}/${now.year}';

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (index == 0)
                const Divider(color: Colors.grey, height: 1, thickness: 1),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _gardenPlans[index],
                      style: const TextStyle(
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'last edited $formattedDate',
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(color: Colors.grey, height: 1, thickness: 1),
            ],
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddGardenDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}