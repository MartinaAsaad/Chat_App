import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  TextFieldCustom({super.key, this.hinttext, this.ispassword, this.suffixicon,this.onchanged});
  String? hinttext;
  Icon? suffixicon;
  bool? ispassword;
  Function(String)? onchanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        obscureText: ispassword ?? false,
        cursorColor: Colors.black,
        onChanged: onchanged,
        validator: (value) {
          if(value==null||value.isEmpty){
            return 'invalid input';
          }
        },
        decoration: InputDecoration(
            suffixIcon: suffixicon,
            labelText: hinttext,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.teal)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
      ),
    );
  }
}
