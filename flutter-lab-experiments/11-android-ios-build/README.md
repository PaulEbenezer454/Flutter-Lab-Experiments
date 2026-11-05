# Experiment 11 – Build for Android and iOS

This experiment is a platform build procedure. Use any Flutter app project as the source app.

## Android
1. Install Android Studio and Android SDK.
2. Run `flutter doctor`.
3. Accept licenses: `flutter doctor --android-licenses`.
4. Start an emulator or connect a device with USB debugging.
5. From a Flutter project folder:

```bash
flutter devices
flutter run
flutter build apk
```

APK output: `build/app/outputs/flutter-apk/app-release.apk`.

## iOS (macOS and Xcode required)
1. Install Xcode and its required components.
2. Open the iOS Simulator or connect a configured iPhone.
3. From a Flutter project folder:

```bash
flutter doctor
open -a Simulator
open ios/Runner.xcworkspace
flutter run
flutter build ios
flutter build ipa
```

IPA output is typically under `build/ios/ipa/`. Device and distribution builds require valid Apple signing configuration.
