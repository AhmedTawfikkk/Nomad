import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:softwareengineering/Galal/core/widgets/custom_text_form_field.dart';
import 'package:softwareengineering/Galal/pages/register_screen/register_screen.dart';
import 'package:softwareengineering/bottom-nav-bar.dart';

abstract class BaseHandler {
  BaseHandler? nextHandler;

  void setNext(BaseHandler handler) {
    nextHandler = handler;
  }

  void handleRequest(BuildContext context, String email, String password);
}

class EmailHandler extends BaseHandler {
  @override
  void handleRequest(BuildContext context, String email, String password) {
    var regularExpression = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regularExpression.hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Invalid email format'),
      ));
    } else if (nextHandler != null) {
      nextHandler!.handleRequest(context, email, password);
    }
  }
}

class PasswordHandler extends BaseHandler {
  @override
  void handleRequest(BuildContext context, String email, String password) {
    if (password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Password cannot be empty'),
      ));
    } else if (nextHandler != null) {
      nextHandler!.handleRequest(context, email, password);
    }
  }
}

class FinalHandler extends BaseHandler {
  @override
  void handleRequest(BuildContext context, String email, String password) async {
    // If email and password are valid, perform login action
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      Navigator.pushNamed(context, BottomNavBar.routeName);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        final snackBar = SnackBar(content: Text('No user found for that email.'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        final snackBar = SnackBar(content: Text('Wrong password provided for that user.'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }
}

class LoginScreen extends StatefulWidget {
  static const String routeName = "Login";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisable = true;
  var formKey = GlobalKey<FormState>();

  late BaseHandler _handler;

  @override
  void initState() {
    super.initState();
    _handler = EmailHandler();
    var passwordHandler = PasswordHandler();
    var finalHandler = FinalHandler();
    _handler.setNext(passwordHandler);
    passwordHandler.setNext(finalHandler);
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset("images/login_pic.png"),
                  SizedBox(height: mediaQuery.height * 0.05),
                  Padding(
                    padding: EdgeInsets.all(mediaQuery.width * 0.1),
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: emailController,
                          readOnly: true,
                          validator: (value) {
                            _handler.handleRequest(
                                context, value ?? '', passwordController.text);
                            return null;
                          },
                          labelText: "البريد الالكتروني",
                        ),
                        SizedBox(height: mediaQuery.height * 0.035),
                        CustomTextFormField(
                          controller: passwordController,
                          readOnly: true,
                          labelText: "كلمة السر",
                          obscureText: isVisable,
                          validator: (value) {
                            _handler.handleRequest(
                                context, emailController.text, value ?? '');
                            return null;
                          },
                          suffixIcon: GestureDetector(
                            onTap: () {
                              isVisable = !isVisable;
                              setState(() {});
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                isVisable == true ? "عرض" : "إخفاء",
                                style: const TextStyle(
                                    color: Color(0xff14213D),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: mediaQuery.height * 0.03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () async {
                                await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
                              },
                              child: const Text("هل نسيت كلمة السر",
                                  style: TextStyle(color: Color(0xffE9824E),fontSize: 12,
                                      fontFamily: 'DG Trika')),
                            ),
                          ],
                        ),
                        SizedBox(height: mediaQuery.height * 0.03),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffe46409),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 95, vertical: 10),
                          ),
                          onPressed: () {
                            _handler.handleRequest(context, emailController.text, passwordController.text);
                          },
                          child: const Text("تسجيل الدخول",
                              style: TextStyle(color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'DG Trika'),),
                        ),
                        SizedBox(height: mediaQuery.height * 0.02),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(color: Color(0xffE9824E)),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 85, vertical: 10),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RegisterScreen.routeName);
                          },
                          child: const Text(
                            "إنشاء حساب جديد",
                            style: TextStyle(color: Color(0xff233166),
                                fontSize: 12,
                                fontFamily: 'DG Trika'
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}