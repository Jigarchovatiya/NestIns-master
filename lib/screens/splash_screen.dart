import 'dart:async';

import 'package:e_com/screens/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bottom_Navigation/bottom_navi_demo.dart';
import '../common_screen/common_container.dart';
import '../global/variable.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => Splash_ScreenState();
}

class Splash_ScreenState extends State<Splash_Screen> {
  Future GetUserName() async {
    var sh = await SharedPreferences.getInstance();
    var IsLoggedIn = sh.getBool(KeyValue);

    Timer(Duration(seconds: 5), () {
      if (IsLoggedIn != null) {
        if (IsLoggedIn) {
          Get.off(Bottom_navigation());
        } else {
          Get.off(On_Boarding());
        }
      } else {
        Get.off(On_Boarding());
      }
    });
  }

  static const String KeyValue = "Login";
  @override
  void initState() {
    GetUserName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonContainer(
            height: Get.height,
            width: Get.width,
            color: black,
            // gradient: LinearGradient(colors: [
            //   LightGreen,
            //   DarkGreen2,
            // ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  height: Get.height * 0.55,
                  width: Get.width * 0.55,
                  image: AssetImage(logo_green),
                ),
                // SizedBox(
                //   height: 7.sp,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Comman_Text(
                //       text: "Nest",
                //       color: white,
                //       fontSize: 30.sp,
                //       fontWeight: FontWeight.bold,
                //     ),
                //     // SizedBox(
                //     //   width: 5.sp,
                //     // ),
                //     Comman_Text(
                //       text: "In",
                //       color: white,
                //       fontSize: 30.sp,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
