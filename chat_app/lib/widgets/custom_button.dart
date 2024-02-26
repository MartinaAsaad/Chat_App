
import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
   ButtonCustom({
    super.key, required this.buttonlabel,required this.ontap
  });
final String buttonlabel;
 Function() ontap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: ontap,
        
        child: Text(
          buttonlabel,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        style: ButtonStyle(
          elevation: MaterialStatePropertyAll(3),
            backgroundColor:
                MaterialStatePropertyAll(Colors.teal[100])),
      ),
    );
  }
}