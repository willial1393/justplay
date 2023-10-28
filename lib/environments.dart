abstract class Env {
  static String androidApiKey = const String.fromEnvironment('ANDROID_API_KEY');
  static String androidAppId = const String.fromEnvironment('ANDROID_APP_ID');
  static String androidMessagingSenderId =
      const String.fromEnvironment('ANDROID_MESSAGING_SENDER_ID');
  static String iosApiKey = const String.fromEnvironment('IOS_API_KEY');
  static String iosAppId = const String.fromEnvironment('IOS_APP_ID');
  static String iosIosBundleId =
      const String.fromEnvironment('IOS_BUNDLE_ID');
  static String messagingSenderId =
      const String.fromEnvironment('MESSAGING_SENDER_ID');
  static String projectId = const String.fromEnvironment('PROJECT_ID');
  static String storageBucket = const String.fromEnvironment('STORAGE_BUCKET');
}
