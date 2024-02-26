import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/screens/chatPage.dart';
import 'package:chat_app/screens/loginPage.dart';
import 'package:chat_app/screens/registerPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginPage.id:(context) => LoginPage(),
        RegisterPage.id:(context) => RegisterPage(),
        ChatPage.id:(context) => ChatPage(),
      },
      initialRoute: LoginPage.id,
    );
  }
}
