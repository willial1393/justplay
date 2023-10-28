import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:justplay/app/theme/jp_colors.dart';

abstract class JpNotification {
  static void success(String message) {
    _show(message: message, color: JpColors.green);
  }

  static void error(String message) {
    _show(message: message, color: JpColors.red);
  }

  static void _show({required String message, required Color color}) {
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
                color: color,
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Text(
                    message,
                  ),
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
