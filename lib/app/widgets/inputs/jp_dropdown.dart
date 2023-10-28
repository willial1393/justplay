import 'package:flutter/material.dart';

class JpDropdown extends StatelessWidget {
  final String label;
  final String? value;
  final List<String> options;
  final ValueChanged<String?> onChanged;

  const JpDropdown({
    required this.value,
    required this.options,
    required this.onChanged,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        label: Text(label),
      ),
      isExpanded: true,
      hint: const Text('Select your country'),
      value: value,
      items: options.map((String option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
