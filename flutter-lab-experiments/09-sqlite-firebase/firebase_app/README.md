# Firebase Student App

1. Create a Firebase project in Firebase Console.
2. Install/login to Firebase CLI.
3. Activate FlutterFire CLI.
4. From this folder run `flutterfire configure`.
5. Ensure the generated `lib/firebase_options.dart` exists.
6. Enable Cloud Firestore and configure secure rules.
7. Run `flutter pub get` and `flutter run`.

Commands:
```bash
npm install -g firebase-tools
firebase login
dart pub global activate flutterfire_cli
flutterfire configure
```

`firebase_options.dart` is generated for your own Firebase project and is not included here. Review your security rules before deployment.
