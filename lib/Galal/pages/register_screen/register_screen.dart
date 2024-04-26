
import 'package:flutter/material.dart';
import 'package:softwareengineering/Galal/core/widgets/custom_text_form_field.dart';
import 'package:softwareengineering/Galal/pages/login_screen/login_view.dart';
import 'package:softwareengineering/bottom-nav-bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class RegisterScreen extends StatefulWidget {
  static const String routeName = "Register";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  bool isViasble = true;
  bool confirmPasswordVisale = true;
  var formKey = GlobalKey<FormState>();

  //customer table reference
  CollectionReference Customers = FirebaseFirestore.instance.collection('Customers');


  Future<void> addCustomer() {
    // Call the user's CollectionReference to add a new user
    return Customers
        .add({
      'first_name' : firstNameController.text,
      'last_name' : lastNameController.text,
      'email' : emailController.text,
      'phone_number' : phoneNumberController.text,
      'password' : passwordController.text
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }


  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Directionality(textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    "images/register_pic.png",
                    width: mediaQuery.width,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: firstNameController,
                          readOnly: true,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "You must enter your First Name";
                            }
                            return null;
                          },
                          labelText: "الاسم الأول",
                        ),
                        SizedBox(height: mediaQuery.height * 0.03),
                        CustomTextFormField(
                          controller: lastNameController,
                          readOnly: true,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "You must enter your Last Name";
                            }
                            return null;
                          },
                          labelText: "الاسم الأخير",
                        ),
                        SizedBox(height: mediaQuery.height * 0.03),
                        CustomTextFormField(
                          controller: emailController,
                          readOnly: true,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "You must enter your email";
                            }
                            var regularExpression = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                            if (!regularExpression.hasMatch(value)) {
                              return "Invalid email";
                            }
                            return null;
                          },
                          labelText: "البريد الاكتروني",
                        ),
                        SizedBox(height: mediaQuery.height * 0.03),
                        CustomTextFormField(
                          controller: phoneNumberController,
                          readOnly: true,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "You must enter your Phone Number";
                            }
                            return null;
                          },
                          labelText: "رقم الهاتف",
                        ),
                        SizedBox(height: mediaQuery.height * 0.03),
                        CustomTextFormField(
                          controller: passwordController,
                          readOnly: true,
                          labelText: "كلمة السر",
                          obscureText: isViasble,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "You must enter your password";
                            }
                            return null;
                          },
                          suffixIcon: GestureDetector(
                            onTap: () {
                              isViasble = !isViasble;
                              setState(() {});
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                isViasble == true ? "عرض" : "إخفاء",
                                style: const TextStyle(
                                    color: Color(0xff14213D),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
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
                          onPressed: () async {if(formKey.currentState!.validate()){
                            try {
                              final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                              addCustomer();
                              Navigator.pushNamed(context, BottomNavBar.routeName);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                //if the password is less than 6 characters
                                print('The password provided is too weak.');
                                final snackBar = SnackBar(content: Text('The password provided is too weak.'));
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              } else if (e.code == 'email-already-in-use') {
                                print('The account already exists for that email.');
                                final snackBar = SnackBar(content: Text('The account already exists for that email.'));
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            } catch (e) {
                              print(e);
                            }
                          }
                          },
                          child: const Text("إنشاء حساب جديد",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "DG Trika",
                                  fontSize: 12
                              )
                          ),
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
                                context, LoginScreen.routeName);
                          },
                          child: const Text(
                            "تسجيل الدخول",
                            style: TextStyle(
                                color: Color(0xff233166),
                                fontFamily: "DG Trika",
                                fontSize: 12
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
