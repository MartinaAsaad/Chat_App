 import 'package:flutter/material.dart';

void succesSnackbar(BuildContext context, msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.green,
    ));
  }