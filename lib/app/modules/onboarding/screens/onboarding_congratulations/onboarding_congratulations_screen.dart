import 'package:animate_do/animate_do.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:justplay/app/routes/jp_router.dart';
import 'package:justplay/app/widgets/jp_scaffold.dart';
import 'package:justplay/gen/assets.gen.dart';

@RoutePage()
class OnboardingCongratulationsScreen extends StatelessWidget {
  const OnboardingCongratulationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 3), () async {
        await appRouter.pushAndPopUntil(
          const HomeRoute(),
          predicate: (route) => true,
        );
      });
    });
    return JpScaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            FadeIn(
              child: ClipOval(
                child: Assets.icon.icon.image(width: 0.5.sw),
              ),
            ),
            Assets.animations.congratulations.lottie(
              width: 0.8.sw,
              repeat: false,
            ),
          ],
        ),
      ),
    );
  }
}
