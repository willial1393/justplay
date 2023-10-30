import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:justplay/app/theme/jp_colors.dart';

abstract class JpNotification {
  static void success(String message) {
    _show(
      message: message,
      backgroundColor: JpColors.green,
      textColor: JpColors.white,
      icon: CupertinoIcons.check_mark_circled,
    );
  }

  static void error(String message) {
    _show(
      message: message,
      backgroundColor: JpColors.red,
      textColor: JpColors.white,
      icon: CupertinoIcons.clear_circled,
    );
  }

  static void _show({
    required String message,
    required Color backgroundColor,
    required Color textColor,
    required IconData icon,
  }) {
    unawaited(
      SmartDialog.showToast(
        message,
        alignment: Alignment.bottomCenter,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 1.sw,
                color: backgroundColor,
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    SizedBox(width: 10.w),
                    Icon(
                      icon,
                      color: textColor,
                      size: 20.sp,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      message,
                      style: TextStyle(
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
            ],
          );
        },
      ),
    );
  }
}
