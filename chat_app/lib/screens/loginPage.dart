import 'package:chat_app/helper/errornasck.dart';
import 'package:chat_app/helper/successnack.dart';
import 'package:chat_app/screens/chatPage.dart';
import 'package:chat_app/screens/registerPage.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  static String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formkey = GlobalKey();

  String? mail;

  String? pass;
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        progressIndicator: CircularProgressIndicator(
          color: Colors.grey,
        ),
        inAsyncCall: isloading,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.transparent,
                          child: Image.asset(
                            'assets/images/scholar.png',
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Scholar Chat',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Pacifico',
                            color: Colors.teal[100]),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Sign In',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    TextFieldCustom(
                      hinttext: 'Email',
                      suffixicon: Icon(Icons.email),
                      onchanged: (value) {
                        mail = value;
                      },
                    ),
                    TextFieldCustom(
                      hinttext: 'Password',
                      ispassword: true,
                      suffixicon: Icon(Icons.remove_red_eye),
                      onchanged: (value) {
                        pass = value;
                      },
                    ),
                    ButtonCustom(
                      buttonlabel: 'Login',
                      ontap: () async {
                        if (formkey.currentState!.validate()) {
                          isloading = true;
                          setState(() {});
                          var auth = FirebaseAuth.instance;
                          try {
                            UserCredential user =
                                await auth.signInWithEmailAndPassword(
                                    email: mail!, password: pass!);
                            isloading = false;
                            setState(() {});
                            succesSnackbar(context, 'logged in');
                            Navigator.pushNamed(context, ChatPage.id,arguments: mail);
                          } on FirebaseAuthException catch (e) {
                            isloading = false;
                            setState(() {});
                            if (e.code == 'user-not-found') {
                              errorSnackbar(
                                  context, 'No user found for that email');
                            } else if (e.code == 'wrong-password') {
                              errorSnackbar(context,
                                  'Wrong password provided for that user');
                            } else {
                              errorSnackbar(context, 'Wrong mail or password');
                            }
                          } catch (e) {
                            isloading = false;
                            setState(() {});

                            errorSnackbar(context, 'Invalid Inputs');
                          }
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account?'),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, RegisterPage.id);
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(color: Colors.teal[200]),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
