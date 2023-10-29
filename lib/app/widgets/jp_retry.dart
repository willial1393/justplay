import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:justplay/app/theme/jp_colors.dart';

class JpRetry extends StatelessWidget {
  final AsyncCallback onPressed;

  const JpRetry({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: JpColors.white,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              BoxShadow(
                color: JpColors.blackLight,
                blurRadius: 2.r,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.refresh,
                size: 20.sp,
                color: JpColors.black,
              ),
              const Text('Retry'),
            ],
          ),
        ),
      ),
    );
  }
}
