import 'package:country_picker/country_picker.dart';
import 'package:e_com/authantication/Phone%20Authentication/verfiy_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../common_screen/comman_text.dart';
import '../../common_screen/comman_textField.dart';
import '../../common_screen/common_container.dart';

String? phone;
String? verificationCode;

class Enter_mobile extends StatefulWidget {
  @override
  State<Enter_mobile> createState() => _Enter_mobileState();
}

class _Enter_mobileState extends State<Enter_mobile> {
  String countryCode = "91";
  String countryFlag = "";
  final phoneNo = TextEditingController();
  final gloablekey = GlobalKey<FormState>();
  Future sendOtpService() async {
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91${phoneNo.text}",
      verificationCompleted: (phoneAuthCredential) {},
      verificationFailed: (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CommonText(
              text: error.message.toString(),
            ),
          ),
        );
      },
      codeSent: (verificationId, forceResendingToken) {
        setState(() {
          verificationCode = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: gloablekey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'asserts/image/bg.png',
                fit: BoxFit.cover,
                height: height * 0.3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CommonText(
                  color: Colors.grey,
                  text: "Please enter your phone number to\nverify your account",
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: CommonTextFiled(
                  keyboardType: TextInputType.phone,
                  labelText: "Enter Number",
                  hintText: "Enter number",
                  controller: phoneNo,
                  maxLength: 10,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Plz Enter Number";
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      gloablekey.currentState!.validate();
                    });
                  },
                  suffixIcon: phoneNo.text.length == 10 ? Icon(Icons.check_circle, color: Colors.green) : SizedBox(),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 15, top: 0, right: 10),
                    child: InkWell(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          countryListTheme: CountryListThemeData(
                            flagSize: 25,
                            backgroundColor: Colors.white,
                            textStyle: TextStyle(fontSize: 16, color: Colors.blueGrey),
                            bottomSheetHeight: 500, // Optional. Country list modal height
                            //Optional. Sets the border radius for the bottomsheet.
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                            //Optional. Styles the search field.
                            inputDecoration: InputDecoration(
                              labelText: 'Search',
                              hintText: 'Start typing to search',
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: const Color(0xFF8C98A8).withOpacity(0.2),
                                ),
                              ),
                            ),
                          ),
                          showPhoneCode: true,
                          onSelect: (Country country) {
                            setState(() {
                              countryCode = country.phoneCode;
                              countryFlag = country.flagEmoji;
                            });
                          },
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("+${countryCode}"),
                          Text(countryFlag.isEmpty ? "" : countryFlag),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CommonContainer(
                  onTap: () {
                    if (gloablekey.currentState!.validate()) {
                      print("validation");
                      sendOtpService().then(
                        (value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VerifyOtp(),
                          ),
                        ),
                      );
                    }
                  },
                  child: Center(
                    child: CommonText(
                      text: "Send Verification Code",
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  height: 45.sp,
                  width: double.infinity,
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffB7E4C7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
