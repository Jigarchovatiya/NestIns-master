import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/controller.dart';

class Like_btn extends StatelessWidget {
  Like_btn({Key? key, this.color, this.color_outline, this.size, this.onTap}) : super(key: key);
  final color;
  final color_outline;
  final void Function()? onTap;
  final size;
  final Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: controller.like_btn == false
          ? Icon(
              Icons.favorite,
              color: color,
              size: size,
            )
          : Icon(
              Icons.favorite_outline,
              color: color_outline,
              size: size,
            ),
    );
  }
}
