import 'package:flutter/material.dart';

class AppNavigationBar extends StatelessWidget {
  final Color backColor;
  final Function()? onBack;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  const AppNavigationBar(
      {Key? key,
      this.backColor = Colors.white,
      this.child,
      this.onBack,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onTap() => {
          if (Navigator.canPop(context)) {Navigator.pop(context)}
        };
    return GestureDetector(
      onTap: onBack ?? onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: padding ?? const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Transform.scale(
              scale: 1.5,
              child: Icon(
                Icons.chevron_left_sharp,
                color: backColor,
              ),
            ),
            child ?? Container(),
          ],
        ),
      ),
    );
  }
}
