import 'package:flutter/material.dart';
import 'package:myapp/components/text_field_container.dart';
import 'package:myapp/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final String msgError;
  final TextEditingController controller;
  const RoundedInputField({
    super.key, 
    required this.hintText, 
    required this.icon, 
    required this.onChanged, 
    required this.msgError, 
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        validator: (text){
          if(text == null || text.isEmpty){
            return msgError;
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: hintText,
          icon: Icon(icon, color: fourColor,),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

