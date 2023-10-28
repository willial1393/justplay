import 'package:auto_route/auto_route.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:justplay/app/routes/jp_router.dart';
import 'package:justplay/app/theme/jp_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Just Play',
        theme: JpTheme.light,
        routerConfig: appRouter.config(
          navigatorObservers: () => [
            AutoRouteObserver(),
            FlutterSmartDialog.observer,
            if (kReleaseMode)
              FirebaseAnalyticsObserver(
                analytics: FirebaseAnalytics.instance,
              ),
          ],
        ),
        builder: FlutterSmartDialog.init(),
      ),
    );
  }
}
