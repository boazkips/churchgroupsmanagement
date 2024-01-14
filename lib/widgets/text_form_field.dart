import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:flutter/material.dart';

class IconTextField extends StatelessWidget {
  const IconTextField({
    super.key,
    required this.fieldLabel,
    required this.fieldHelper,
    required this.fieldIcon,
  });

  final String fieldLabel;
  final String fieldHelper;
  final IconData fieldIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        height: 1,
        fontSize: 13,
      ),
      decoration: AppDecorations().inputDecoration1(
        fieldLabel: fieldLabel,
        fieldHelper: fieldHelper,
        fieldIcon: fieldIcon,
      ),
    );
  }
}
