import 'package:flutter/material.dart';

class SenderBubble extends StatelessWidget {
  const SenderBubble({
    super.key, required this.msg, required this.date,
  });
final String msg;
final String date;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(maxWidth: 300),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              Color.fromARGB(255, 153, 207, 203),
              Color.fromARGB(255, 63, 166, 184),
            ]),
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 105, 105, 105),
                  offset: Offset(0, 3),
                  blurRadius: 5)
            ],
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(24),
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24))),
      ),
    );
  }
}
