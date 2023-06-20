import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../common_screen/comman_text.dart';
import '../common_screen/common_container.dart';
import '../getx/controller.dart';
import '../global/variable.dart';
import 'login_screen_h.dart';

class On_Boarding extends StatefulWidget {
  const On_Boarding({Key? key}) : super(key: key);

  @override
  State<On_Boarding> createState() => _On_BoardingState();
}

class _On_BoardingState extends State<On_Boarding> {
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: GetBuilder<Controller>(
            builder: (controller) => Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10.sp, top: 10.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Get.off(Tab_Bar());
                            },
                            child: CommonText(
                              text: "Skip",
                              //fontFamily: "JB1",
                              fontWeight: FontWeight.bold,
                              color: black,
                              fontSize: 17.sp,
                            )),
                      ],
                    ),
                  ),
                  CommonContainer(
                    height: 400.sp,
                    width: width,
                    child: PageView(
                      controller: pageController,
                      onPageChanged: (value) {
                        controller.onBoardingOnChange.value = value;
                      },
                      children: List.generate(
                        3,
                        (index) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              onbording[index]['img'],
                            ),
                            SizedBox(
                              height: 45.sp,
                            ),
                            CommonText(
                              color: black,
                              text: onbording[index]['name'],
                              fontWeight: FontWeight.bold,
                              //fontFamily: "JM1",
                              fontSize: 17.sp,
                            ),
                            SizedBox(
                              height: 20.sp,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: CommonText(
                                color: grey,
                                text: onbording[index]['subtitle'],
                                fontWeight: FontWeight.bold,
                                //fontFamily: "JV1",
                                fontSize: 15.sp,
                              ),
                            ),
                            CommonText(
                              color: grey,
                              text: onbording[index]['subtitle2'],
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.sp,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        3,
                        (index) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2),
                              child: CircleAvatar(
                                radius: 5,
                                backgroundColor: controller.onBoardingOnChange.value == index ? LightGreen : black,
                              ),
                            )),
                  ),
                  SizedBox(
                    height: 40.sp,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        controller.onBoardingOnChange.value == 1 || controller.onBoardingOnChange.value == 2
                            ? Container(
                                child: InkWell(
                                  onTap: () {
                                    pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                                  },
                                  child: Icon(Icons.arrow_back, color: white, size: 27),
                                ),
                                height: 45.sp,
                                width: 45.sp,
                                decoration: BoxDecoration(
                                  color: DarkGreen2,
                                  shape: BoxShape.circle,
                                ),
                              )
                            : SizedBox(),
                        Container(
                          child: InkWell(
                            onTap: () {
                              if (controller.onBoardingOnChange.value == 2) {
                                Get.off(Tab_Bar());
                              } else {
                                pageController.nextPage(duration: Duration(milliseconds: 600), curve: Curves.easeIn);
                              }
                            },
                            child: Icon(Icons.arrow_forward, color: white, size: 27),
                          ),
                          height: 45.sp,
                          width: 45.sp,
                          decoration: BoxDecoration(
                            color: DarkGreen2,
                            shape: BoxShape.circle,
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
