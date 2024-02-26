import 'package:flutter/foundation.dart';

class Message{
  final String msg;
  final bool issender;
  final String date;
final String id;
  Message({required this.id,required this.msg, required this.issender, required this.date});
  factory Message.fromjson(data){
return Message(msg: data['msg'], issender: data['issender'], date: data['date'], id: data['id']);
  }
}