import 'package:flutter/material.dart';
import 'package:green_project/components/text_field_container.dart';
import 'package:green_project/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    super.key,
    required this.onChanged,
    required TextEditingController controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: const InputDecoration(
          hintText: 'Contraseña',
          icon: Icon(
            Icons.lock,
            color: fourColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: fourColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
