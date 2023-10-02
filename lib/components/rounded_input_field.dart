import 'package:flutter/material.dart';
import 'package:green_project/components/text_field_container.dart';
import 'package:green_project/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    required TextEditingController controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          icon: Icon(
            icon,
            color: fourColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
