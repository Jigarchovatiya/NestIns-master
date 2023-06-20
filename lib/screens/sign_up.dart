import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com/common_screen/comman_text.dart';
import 'package:e_com/common_screen/comman_textField.dart';
import 'package:e_com/common_screen/common_container.dart';
import 'package:e_com/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../authantication/email authantication/EmailAuthService.dart';
import '../authantication/google auth service/google_auth_service.dart';
import '../bottom_Navigation/bottom_navi_demo.dart';
import '../common_screen/loding.dart';
import '../global/variable.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({Key? key}) : super(key: key);

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> with SingleTickerProviderStateMixin {
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final PasswordController = TextEditingController();
  bool passwordCheck = true;
  int selected = 0;
  //bool signuploder = false;
  List name = [
    'Sign Up',
    'Sign In',
  ];
  TabController? tabController;
  final gloablekey = GlobalKey<FormState>();
  List tabItem = [
    "Sign Up",
    "Sign In",
  ];

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp),
        child: Form(
          key: gloablekey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 17.sp,
              ),
              CommonTextFiled(
                filled: true,
                fillColor: Colors.grey.shade200,
                controller: userNameController,
                hintText: "Enter Name",
                hintFontFamily: "JM1",
                fontFamily: "JV1",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Name";
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    gloablekey.currentState!.validate();
                  });
                },
                suffixIcon: userNameController.text.length > 2
                    ? Icon(
                        Icons.check_circle,
                        color: black,
                      )
                    : SizedBox(),
                prefixIcon: Icon(
                  Icons.person_outlined,
                  size: 20.sp,
                  color: grey,
                ),
              ),
              SizedBox(
                height: 15.sp,
              ),
              CommonTextFiled(
                fontFamily: "JV1",
                filled: true,
                fillColor: Colors.grey.shade200,
                controller: emailController,
                hintText: "Enter Email",
                hintFontFamily: "JM1",
                validator: (value) {
                  final bool emailValid = email.hasMatch(value!);

                  if (emailValid) {
                    return null;
                  } else {
                    return "Please enter valid Email Id";
                  }
                },
                onChanged: (value) {
                  gloablekey.currentState!.validate();
                },
                suffixIcon: emailController.text.length == 10
                    ? Icon(
                        Icons.check_circle,
                        color: black,
                      )
                    : SizedBox(),
                prefixIcon: Icon(
                  Icons.email,
                  size: 20.sp,
                  color: grey,
                ),
              ),
              SizedBox(
                height: 15.sp,
              ),
              CommonTextFiled(
                filled: true,
                fillColor: Colors.grey.shade200,
                controller: PasswordController,
                obscureText: passwordCheck,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      passwordCheck = !passwordCheck;
                    });
                  },
                  icon: passwordCheck ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                ),
                hintText: "Enter password",
                hintFontFamily: "JM1",
                fontFamily: "JV1",
                validator: (value) {
                  final bool passwordValid = password.hasMatch(value!);

                  if (value.isEmpty) {
                    return "Enter Password";
                  } else if (passwordValid != true) {
                    return "please enter valid password";
                  }
                  return null;
                },
                onChanged: (value) {
                  gloablekey.currentState!.validate();
                },
                prefixIcon: Icon(
                  Icons.lock,
                  size: 20.sp,
                  color: grey,
                ),
              ),
              SizedBox(
                height: 15.sp,
              ),
              contoller.signUpLoader == false
                  ? Center(
                      child: CommonContainer(
                        borderRadius: BorderRadius.circular(40),
                        onTap: () {
                          print("sign up Loader first ${contoller.signUpLoader}");
                          if (gloablekey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return LoadingDialogue(
                                  message: "",
                                );
                              },
                            );
                            // controller.signuploder = true.obs;
                            print("Sign up loader true ${contoller.signUpLoader}");
                            EmailAuthService.SignupUser(email: emailController.text, password: PasswordController.text).then((value) async {
                              if (value != null) {
                                Get.back();
                                Get.off(Bottom_navigation());
                                FirebaseFirestore.instance.collection("user").doc(FirebaseAuth.instance.currentUser!.uid).set({
                                  "profile_image": "",
                                  "profile_name": profile_name,
                                  "profile_email": profile_email,
                                  "favourite": [],
                                  "buyNow": [],
                                  "add to cart": [],
                                  "User_id": FirebaseAuth.instance.currentUser!.uid,
                                });
                                SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                                await sharedPreferences.setBool(Splash_ScreenState.KeyValue, true);
                                await sharedPreferences.setString("profile_name", userNameController.text);
                                await sharedPreferences.setString("profile_email", emailController.text);
                              } else {
                                Get.back();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Email is already in use by another account"),
                                  ),
                                );
                              }
                            });
                          }
                        },
                        height: 35.sp,
                        width: 140.sp,
                        color: LightGreen,
                        child: Center(
                          child: CommonText(
                            text: "Sign Up",
                            color: white,
                            //fontFamily: "JM1",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    )
                  : Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }
}
