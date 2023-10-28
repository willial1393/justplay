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

