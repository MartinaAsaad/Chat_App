  import 'package:flutter/material.dart';

void errorSnackbar(BuildContext context, msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.red,
    ));
  }
