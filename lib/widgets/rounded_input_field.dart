import 'package:flutter/material.dart';


import 'package:alert_app/widgets/text_field_container.dart';
import 'package:alert_app/helpers/constansts.dart';


class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        autofocus: false,
        controller: controller,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        
        decoration: InputDecoration(
          
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          
          hintText: hintText,
          border: InputBorder.none,
        ),
        
      ),
    );
  }
}