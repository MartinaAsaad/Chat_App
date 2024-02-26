import 'package:chat_app/models/message.dart';
import 'package:chat_app/widgets/reciever_bubble.dart';
import 'package:chat_app/widgets/sender_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key});
  static String id = 'ChatPage';

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController controller = TextEditingController();

  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');

  String? msg;
  ScrollController _controller = ScrollController();
  
  @override
  Widget build(BuildContext context) {
    var email=ModalRoute.of(context)!.settings.arguments ;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy('createddate',descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Message> messagemodel = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagemodel.add(Message.fromjson(snapshot.data!.docs[i]));
            }

            return Scaffold(
              
              appBar: AppBar(
                clipBehavior: Clip.hardEdge,
                elevation: 5,
                backgroundColor: Colors.teal[200],
                toolbarHeight: 60,
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.only(
                //       bottomLeft: Radius.circular(50.0),
                //       bottomRight: Radius.circular(50.0)),
                // ),
                shadowColor: Colors.black,
                automaticallyImplyLeading: false,
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/scholar.png',
                        scale: 1.5,
                      ),
                      Text(
                        'Chat',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              backgroundColor: Colors.white,
              body: Stack(alignment: Alignment.bottomCenter, children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/ef6644296a70c07fcf55823a157a9b8b.jpg'),
                        fit: BoxFit.cover),
                  ),
                  height: double.infinity,
                ),
                Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        reverse: true,

                          itemCount: messagemodel.length + 1,
                          controller: _controller,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return SizedBox(
                                height: 100,
                              );
                            }
                            if (messagemodel[index-1].id==email) {
                              return RecieverBubble(
                                msg: messagemodel[index-1].msg,
                                date: messagemodel[index-1].date,
                              );
                            } else {
                              return SenderBubble(
                                msg: messagemodel[index-1].msg,
                                date: messagemodel[index-1].date,
                              );
                            }
                          }),
                    ),
                  ],
                ),
                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            onChanged: (value) {
                              msg = value;
                            },
                            onSubmitted: (value) {
                              if (value != null) {
                                messages.add({
                                  'msg': value,
                                  'issender': true,
                                  'date':
                                      '${DateTime.now().hour.toString()}:${DateTime.now().minute.toString()}',
                                  'createddate': DateTime.now(),
                                  'id':email
                                });
                                controller.clear();
                                
                                _controller.animateTo(
                                   0,
                                    duration: Duration(seconds: 1),
                                    curve: Curves.fastOutSlowIn);
                              }
                            },
                            controller: controller,
                            decoration: InputDecoration(
                              hintText: 'Send Message',
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Colors.teal)),
                              fillColor: Color.fromARGB(255, 255, 255, 255),
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (msg != null) {
                              messages.add({
                                'msg': msg,
                                'issender': true,
                                'date':
                                    '${DateTime.now().hour.toString()}:${DateTime.now().minute.toString()}',
                                'createddate': DateTime.now(),
                                 'id':email
                              });
                              controller.clear();
                              _controller.animateTo(
                                  0,
                                  duration: Duration(seconds: 1),
                                  curve: Curves.fastOutSlowIn);
                            }
                          },
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.teal[200],
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 72, 72, 72),
                                    offset: Offset(2, 2),
                                    blurRadius: 2)
                              ],
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(
                              Icons.send,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            );
          } else {
            return Scaffold(body: Center(child: Text('loading.....')));
          }
        });
  }
}
