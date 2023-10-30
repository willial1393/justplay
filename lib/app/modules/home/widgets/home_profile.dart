import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:justplay/app/providers/app_provider.dart';
import 'package:justplay/app/routes/jp_router.dart';
import 'package:justplay/app/theme/jp_colors.dart';
import 'package:justplay/core/services/i_auth_service.dart';
import 'package:justplay/gen/assets.gen.dart';
import 'package:justplay/injectable.dart';

class HomeProfile extends ConsumerWidget {
  const HomeProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(
      appProvider.select((value) => value.user),
    );
    return Padding(
      padding: EdgeInsets.all(30.w),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipOval(
              child: Assets.icon.icon.image(width: 0.3.sw),
            ),
            SizedBox(height: 30.h),
            Text(
              'Hi, ${user?.name}',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.h),
            _Info(
              label: 'Email',
              text: user?.email ?? '',
            ),
            _Info(
              label: 'Country',
              text: user?.country ?? '',
            ),
            _Info(
              label: 'State',
              text: user?.state ?? '',
            ),
            _Info(
              label: 'City',
              text: user?.city ?? '',
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () async {
                await _logout(context);
              },
              child: const Text(
                'Close session',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _logout(BuildContext context) async {
    await getIt<IAuthService>().logout();
    await appRouter.pushAndPopUntil(
      const ChargingRoute(),
      predicate: (route) => true,
    );
    Phoenix.rebirth(appRouter.navigatorKey.currentContext!);
  }
}

class _Info extends StatelessWidget {
  final String label;
  final String text;

  const _Info({required this.label, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: JpColors.white,
        border: Border.all(
          color: JpColors.grey,
          width: 1.sp,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
