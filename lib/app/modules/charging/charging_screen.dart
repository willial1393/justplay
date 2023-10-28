import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:justplay/app/routes/jp_router.dart';
import 'package:justplay/app/widgets/jp_loading.dart';
import 'package:justplay/app/widgets/jp_scaffold.dart';

@RoutePage()
class ChargingScreen extends StatefulWidget {
  const ChargingScreen({Key? key}) : super(key: key);

  @override
  State<ChargingScreen> createState() => _ChargingScreenState();
}

class _ChargingScreenState extends State<ChargingScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (FirebaseAuth.instance.currentUser != null) {
        appRouter.replace(const HomeRoute());
      }else {
        appRouter.replace(const OnboardingLoginRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const JpScaffold(
      body: Center(
        child: JpLoading(),
      ),
    );
  }
}
