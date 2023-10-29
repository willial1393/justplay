import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:justplay/app/widgets/jp_loading.dart';

class JpDropdown extends StatelessWidget {
  final String label;
  final String? value;
  final List<String> options;
  final ValueChanged<String?> onChanged;
  final bool loading;

  const JpDropdown({
    required this.value,
    required this.options,
    required this.onChanged,
    required this.label,
    this.loading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            label: Text(label),
          ),
          isExpanded: true,
          value: value,
          items: options.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
          onChanged: onChanged,
        ),
        if (loading)
          GestureDetector(
            child: Container(
              color: Colors.transparent,
              width: 1.sw,
              height: 45.h,
              child: Center(
                child: JpLoading(size: 20.h),
              ),
            ),
          ),
      ],
    );
  }
}
