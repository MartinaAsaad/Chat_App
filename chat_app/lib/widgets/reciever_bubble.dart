import 'package:flutter/material.dart';

class RecieverBubble extends StatelessWidget {
  const RecieverBubble({
    super.key, required this.msg, required this.date,
  });
  final String msg;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(maxWidth: 300),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              msg,
              style: TextStyle(color: Colors.white),
            ),
            Text(date,style: TextStyle(color: Colors.white),)
          ],
        ),
        padding: EdgeInsets.all( 15),
        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 2, 130, 117),
              Color.fromARGB(255, 4, 104, 122),
            ]),
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 105, 105, 105),
                  offset: Offset(0, 3),
                  blurRadius: 5)
            ],
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24))),
      ),
    );
  }
}
