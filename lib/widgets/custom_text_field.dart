import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    this.hintText, this.onChanged ,
    this.obscureText =false,
    this.inputType
  });
  Function(String)? onChanged;
  String? hintText;
  TextInputType? inputType;
  bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:obscureText!,
      keyboardType: TextInputType.text,
      // validator: (data) {
      //   if (data!.isEmpty) {
      //     return 'field is required';
      //   }
      // },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(8.0)
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(),
           borderRadius: BorderRadius.circular(8.0)
        ),
      ),
    );
  }
}
