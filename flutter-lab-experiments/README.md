# Flutter Lab Experiments 1–12

A GitHub-ready collection of Flutter practical experiments. Each numbered folder is a separate Flutter project, except Experiment 9, which contains separate SQLite and Firebase projects.

## Requirements
- Flutter SDK and Dart SDK
- VS Code or Android Studio
- Chrome for Experiment 12
- Android Studio / Android SDK for Android builds
- macOS and Xcode for iOS builds
- Firebase CLI and FlutterFire CLI for the Firebase project in Experiment 9

## Experiments
1. Basic Flutter Application
2. Layout Widgets
3. Responsive Layout
4. Form Validation
5. Assets and Media
6. Navigation Between Screens
7. Animation using AnimatedContainer
8. State Management and JSON
9. SQLite and Firebase CRUD
10. REST API Integration
11. Android and iOS Build Guide
12. Flutter Web Application

## Run an experiment
Open the experiment folder containing `pubspec.yaml`, then run:

```bash
flutter pub get
flutter run
```

For web:

```bash
flutter run -d chrome
flutter build web
```

For Android:

```bash
flutter build apk
```

## Experiment 9
- `09-sqlite-firebase/sqlite_app` is the local SQLite project.
- `09-sqlite-firebase/firebase_app` is the Cloud Firestore project. Run `flutterfire configure` after creating your Firebase project; it generates `lib/firebase_options.dart`, which is intentionally not included because it is specific to your Firebase project.

## Notes
- Experiment 5 includes an `assets/images/README.txt` placeholder. Add your own image named `flutter.png` in that folder before running.
- Experiment 9 SQLite uses `sqflite`, intended for Android/iOS. It is not a normal Flutter Web database implementation.
- Do not commit passwords, API secrets, signing keys, or private Firebase credentials.
- Experiment 11 is a platform build guide rather than a standalone app project.

## Author
Flutter Practical Laboratory Collection
