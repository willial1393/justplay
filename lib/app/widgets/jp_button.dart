import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:justplay/app/theme/jp_colors.dart';
import 'package:justplay/app/widgets/jp_loading.dart';

class JpButton extends StatefulWidget {
  final String text;
  final bool enabled;
  final Color? backgroundColor;
  final Color? textColor;
  final AsyncCallback? onPressed;

  const JpButton({
    required this.text,
    super.key,
    this.enabled = true,
    this.backgroundColor,
    this.textColor,
    this.onPressed,
  });

  @override
  State<JpButton> createState() => _JpButtonState();
}

class _JpButtonState extends State<JpButton> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.enabled ? _onPressed : null,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(JpColors.white),
        minimumSize: MaterialStateProperty.all(Size(
          double.infinity,
          30.h,
        )),
        backgroundColor: MaterialStateProperty.all(
          (widget.backgroundColor ?? JpColors.orange).withOpacity(
            widget.enabled ? 1 : 0.5,
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        )),
      ),
      child: loading
          ? JpLoading(
              color: widget.textColor ?? JpColors.white,
              size: 20.h,
            )
          : Text(
              widget.text,
              style: TextStyle(
                color: widget.textColor ?? JpColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
    );
  }

  Future<void> _onPressed() async {
    setState(() {
      loading = true;
    });
    try {
      await widget.onPressed?.call();
    } catch (e) {
      rethrow;
    } finally {
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    }
  }
}
