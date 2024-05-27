import 'package:flutter/material.dart';
import 'package:myapp/components/text_field_container.dart';
import 'package:myapp/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final String msgError;
  const RoundedPasswordField({
    super.key, 
    required this.onChanged, 
    required this.controller, 
    required this.msgError,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: true,
        controller: controller,
        validator: (text){
          if(text == null || text.isEmpty){
            return msgError;
          }
          return null;
        },
        onChanged: onChanged,
        decoration: const InputDecoration( 
          hintText: 'Contraseña',
          icon: Icon(Icons.lock,
          color: fourColor,
          ),
        suffixIcon: Icon(
          Icons.visibility,
          color: fourColor,
          ),
          border: InputBorder.none,
        ) ,
      ),
    );
  }
}

