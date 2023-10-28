import 'package:flutter/material.dart';
import 'package:justplay/app/theme/jp_colors.dart';

class JpLoading extends StatelessWidget {
  const JpLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: JpColors.black,
    );
  }
}
