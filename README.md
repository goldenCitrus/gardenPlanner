# Garden Planner

A Flutter-based mobile application designed to help users create, manage, and visualize their garden layout plans. It currently features a clean UI to list active garden projects and utilizes dynamic dialogs with form validation for creating new ones.

## Instructions for Build and Use

Steps to build and/or run the software:

1. Ensure the Flutter SDK is installed and configured on your machine.
2. Open the project in your IDE (like Android Studio or VS Code) and run `flutter pub get` in the terminal to fetch any dependencies.
3. Start up a local emulator or connect a physical device.
4. Run the app using `flutter run` in the terminal or by pressing the "Run" button in your IDE.

Instructions for using the software:

1. Open the application to view the main dashboard of your current garden plans.
2. Click the floating "+" button in the bottom right corner to open the creation dialog.
3. Enter a name for your new garden plan (if you leave it empty, a red warning toast will appear at the top of the screen).
4. Click "Submit" to instantly save the plan to memory and see it generated as a formatted card on your home screen.

## Development Environment

To recreate the development environment, you need the following software and/or libraries:

* Flutter SDK
* Dart programming language
* Android Studio (or VS Code)
* Android Emulator or iOS Simulator

## Useful Websites to Learn More

I found these websites useful in developing this software:

* [pub.dev](https://pub.dev/)
* Gemini AI
* [Official "Get started with Flutter and Dart" Youtube Playlist](https://youtube.com/playlist?list=PLjxrf2q8roU2bqkohF-r9TNmo8HWSu0TG&si=jUJzcjjjSxX0_X_d)
* [Flutter Official Documentation](https://docs.flutter.dev/)

## Future Work

The following items I plan to fix, improve, and/or add to this project in the future:

* [ ] Implement persistent local storage (using tools like `shared_preferences` or Hive) so garden plans are not erased during an app restart.
* [ ] Develop the visual 2D mapping grid (utilizing Flutter's `InteractiveViewer`) to allow the user to select a plant and tap on the screen where they want to place it within a selected plan.
* [ ] Add navigation so clicking on a specific garden card on the home screen opens up its detailed layout canvas to see its specific plants.
* [ ] Implement robust state management to handle passing data between the master list and the individual garden editing screens.
* [ ] Integrate the Perenual API to provide detailed plant care instructions and botanical information for the plants added to the garden.