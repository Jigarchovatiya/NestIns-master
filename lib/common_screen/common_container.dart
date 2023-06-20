import 'package:flutter/material.dart';

class CommonContainer extends StatelessWidget {
  const CommonContainer({
    Key? key,
    this.width,
    this.child,
    this.height,
    this.gradient,
    this.color,
    this.image,
    this.border,
    this.borderRadius,
    this.boxShadow,
    this.onTap,
    this.margin,
    this.alignment,
  }) : super(key: key);

  final double? width;
  final AlignmentGeometry? alignment;
  final child;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final Gradient? gradient;
  final color;
  final DecorationImage? image;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final boxShadow;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: alignment,
        width: width,
        margin: margin,
        height: height,
        child: child,
        decoration: BoxDecoration(
          gradient: gradient,
          color: color,
          image: image,
          borderRadius: borderRadius,
          border: border,
          boxShadow: boxShadow,
        ),
      ),
    );
  }
}
