import 'package:flutter/material.dart';

import '../colors.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget? child;
  final BorderRadiusGeometry radius;
  final EdgeInsetsGeometry padding;
  final bool loading;
  final Color color;
  final Color? shadowColor;
  final double? elevation;
  final Size? maximumSize;
  final Size? minimumSize;
  final Size? fixedSize;

  const PrimaryButton(
      {Key? key,
      required this.onPressed,
      this.loading = false,
      this.child,
      this.radius = BorderRadius.zero,
      this.padding = const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      this.color = AppColors.primary,
      this.shadowColor,
      this.elevation,
      this.maximumSize,
      this.minimumSize,
      this.fixedSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius:
              radius == BorderRadius.zero ? BorderRadius.circular(10) : radius,
        ),
        padding: padding,
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        shadowColor: shadowColor,
        elevation: elevation,
        maximumSize: maximumSize,
        minimumSize: minimumSize,
        fixedSize: fixedSize,
      ),
      onPressed: onPressed,
      child: loading == true
          ? const CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2,
            )
          : child,
    );
  }
}
