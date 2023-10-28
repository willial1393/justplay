import 'package:flutter/material.dart';
import 'package:justplay/app/theme/jp_colors.dart';

class JpLoading extends StatelessWidget {
  final Color? color;
  final double? size;

  const JpLoading({super.key, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        color: color ?? JpColors.black,
      ),
    );
  }
}
