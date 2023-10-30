# justplay

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Run app

Install flutter 3.13.8 or higher


add the [config.json](config.json) file to the root of the project


```bash
   flutter run --dart-define-from-file=config.json
```

## Generate code

```bash
  flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
```

## Generate app icons

```bash
  flutter pub get && flutter pub run flutter_launcher_icons
```

## Generate apk

```bash
   flutter build apk --dart-define-from-file=config.json
```

## Generate appbundle

```bash
   flutter build appbundle --dart-define-from-file=config.json
```

## Documentation

The architecture of the app is based on the clean architecture principles.


The dependency injection is [get_it](https://pub.dev/packages/get_it)


The active directory is [firebase_auth](https://pub.dev/packages/firebase_auth)


The database is  [cloud_firestore](https://pub.dev/packages/cloud_firestore)


The analytics is  [firebase_analytics](https://pub.dev/packages/firebase_analytics)


The record errors is  [firebase_crashlytics](https://pub.dev/packages/firebase_crashlytics)


The cache is  [flutter_cache_manager](https://pub.dev/packages/flutter_cache_manager)


The state management is  [flutter_riverpod](https://pub.dev/packages/flutter_riverpod) package.


The animations are built using the [lottie](https://pub.dev/packages/lottie) package.


The api used for get country [www.universal-tutorial.com](https://www.universal-tutorial.com/rest-apis/free-rest-api-for-country-state-city)