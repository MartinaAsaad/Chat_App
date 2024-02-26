import 'package:chat_app/helper/errornasck.dart';
import 'package:chat_app/helper/successnack.dart';
import 'package:chat_app/screens/chatPage.dart';
import 'package:chat_app/screens/loginPage.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

const themecolor = Color(0xFF80CBC4);

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});
  static String id = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? mail;

  String? pass;

  bool isloading = false;

  GlobalKey<FormState> formkey = GlobalKey();

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
                        padding: const EdgeInsets.only(top: 50.0),
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
                      'Register',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    TextFieldCustom(
                      hinttext: 'Email',
                      suffixicon: Icon(Icons.email),
                      onchanged: (data) {
                        mail = data;
                      },
                    ),
                    TextFieldCustom(
                      hinttext: 'Password',
                      ispassword: true,
                      onchanged: (data) {
                        pass = data;
                      },
                      suffixicon: Icon(Icons.remove_red_eye),
                    ),
                    ButtonCustom(
                      buttonlabel: 'Register',
                      ontap: () async {
                        if (formkey.currentState!.validate()) {
                          isloading = true;
                          setState(() {});
                          try {
                            await registerUser(mail, pass);
                            isloading = false;
                            setState(() {});

                            succesSnackbar(
                                context, 'Account Created Sucscesfully');
                            Navigator.pushNamed(context, LoginPage.id);
                          } on FirebaseAuthException catch (e) {
                            isloading = false;
                            setState(() {});

                            if (e.code == 'weak-password') {
                              errorSnackbar(
                                  context, 'The password provided is too weak');
                            } else if (e.code == 'email-already-in-use') {
                              errorSnackbar(context,
                                  'The account already exists for that email');
                            } else {
                              errorSnackbar(context, 'Invalid Inputs');
                            }
                          } catch (e) {
                            // TODO
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
                        Text('Already have an account?'),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(color: themecolor),
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

  Future<void> registerUser(mail, pass) async {
    var auth = FirebaseAuth.instance;

    UserCredential userc = await auth.createUserWithEmailAndPassword(
        email: mail!, password: pass!);
  }
}
