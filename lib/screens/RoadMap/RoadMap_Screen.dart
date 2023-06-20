import 'package:e_com/common_screen/comman_text.dart';
import 'package:e_com/common_screen/comman_textField.dart';
import 'package:e_com/globle/variable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class RoadMapScreen extends StatefulWidget {
  const RoadMapScreen({super.key});
  @override
  State<RoadMapScreen> createState() => _RoadMapScreenState();
}

class _RoadMapScreenState extends State<RoadMapScreen> {
  var currentDate;
  DateTime date = DateTime.now();
  int currentStep = 0;
  //sahil

  continueStep() {
    if (currentStep < 3) {
      setState(() {
        currentStep = currentStep + 1; //currentStep+=1;
      });
    }

    if (currentStep == 3) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Product Added!")));
    }
  }

  cancelStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep = currentStep - 1; //currentStep-=1;
      });
    }
  }

  onStepTapped(int value) {
    setState(() {
      currentStep = value;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    currentDate = DateTime.now();
    super.initState();
  }

  Widget controlBuilders(context, details) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          OutlinedButton(
            onPressed: details.onStepCancel,
            child: CommonText(
              text: 'Back',
              //fontFamily: "JB1",
              color: black,
            ),
          ),
          SizedBox(width: Get.width * 0.05),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(DarkGreen),
            ),
            onPressed: details.onStepContinue,
            child: CommonText(
              text: 'Next',
              //fontFamily: "JB1",
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        name: "Order Status & Tracking",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 20.sp),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image(
                  image: AssetImage("asserts/image/DelivryPic.png"),
                ),
              ),
              SizedBox(
                height: 10.sp,
              ),
              CommonTextFiled(
                labelText: "Tracking Number",
                labelStyle: TextStyle(color: DarkGreen, fontFamily: "JB1"),
                hintText: "E.g #120210120210",
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: "Result:",
                    //fontFamily: "JB1",
                    fontSize: 15.sp,
                  ),
                ],
              ),
              Stepper(
                controlsBuilder: controlBuilders,
                type: StepperType.vertical,
                physics: const ScrollPhysics(),
                onStepTapped: onStepTapped,
                onStepContinue: continueStep,
                onStepCancel: cancelStep,
                currentStep: currentStep, //0, 1, 2
                steps: [
                  Step(
                      title: CommonText(
                        text: 'Ordered And Approved', //fontFamily: "JB1"
                      ),
                      subtitle: CommonText(
                        text: "${DateFormat("dd-MMM-yyyy").format(currentDate)}",
                        //fontFamily: "JM1",
                      ),
                      content: CommonText(
                        text: 'This is the First step.', //fontFamily: "JV1"
                      ),
                      isActive: currentStep >= 0,
                      state: currentStep >= 0 ? StepState.complete : StepState.complete),
                  Step(
                    title: CommonText(
                      text: 'Packed',
                      // fontFamily: "JB1",
                    ),
                    subtitle: CommonText(
                      text: "${DateFormat("dd-MMM-yyyy").format(currentDate)}",
                      //fontFamily: "JM1",
                    ),
                    content: CommonText(
                      text: 'This is the Second step.', //fontFamily: "JV1",
                    ),
                    isActive: currentStep >= 0,
                    state: currentStep >= 1 ? StepState.complete : StepState.disabled,
                  ),
                  Step(
                    title: CommonText(
                      text: 'Shipped',
                      //fontFamily: "JB1",
                    ),
                    subtitle: CommonText(
                      text: "${DateFormat("dd-MMM-yyyy").format(currentDate)}",
                      //fontFamily: "JM1",
                    ),
                    content: CommonText(
                      text: 'This is the Second step.',
                      //fontFamily: "JV1",
                    ),
                    isActive: currentStep >= 0,
                    state: currentStep >= 2 ? StepState.complete : StepState.disabled,
                  ),
                  Step(
                    title: CommonText(
                      text: "Delivery",
                      //fontFamily: "JB1",
                    ),
                    subtitle: CommonText(
                      text: "${DateFormat("dd-MMM-yyyy").format(currentDate)}",
                      //fontFamily: "JM1",
                    ),
                    content: CommonText(
                      text: "${DateFormat("dd-MM-yyyy").format(currentDate)}",
                    ),
                    isActive: currentStep >= 0,
                    state: currentStep >= 3 ? StepState.complete : StepState.disabled,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
