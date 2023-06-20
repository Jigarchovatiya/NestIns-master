import 'package:e_com/common_screen/comman_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'common_container.dart';

class LoadingDialogue extends StatelessWidget {
  const LoadingDialogue({Key? key, this.message}) : super(key: key);

  final String? message;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 14.sp),
            // circular progress bar
            child: CommonContainer(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.green),
                )),
          ),
          SizedBox(
            height: 10.sp,
          ),
          CommonText(
            text: message.toString() + " Please wait...",
          )
        ],
      ),
    );
  }
}
