import 'package:flutter/material.dart';
import 'package:mvvm/module/common/colors.dart';
import 'dart:math' as math;

abstract class MenuDashboard extends StatefulWidget {
  static _MenuDashboard of(BuildContext context, {bool root = false}) => root
      ? context.findRootAncestorStateOfType<_MenuDashboard>() as _MenuDashboard
      : context.findAncestorStateOfType<_MenuDashboard>() as _MenuDashboard;

  _MenuDashboard getCurrentState(BuildContext context) =>
      ((context as StatefulElement).state as _MenuDashboard);
  Widget? menu(BuildContext context);
  List<Widget> dashboard(BuildContext context);

  const MenuDashboard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MenuDashboard();
}

class _MenuDashboard extends State<MenuDashboard>
    with TickerProviderStateMixin {
  var _screenWidth = 0.0;
  var _screenHeight = 0.0;
  final _duration = const Duration(milliseconds: 100);
  var _isCollapsed = true;
  var _index = 0;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _menuScaleAnimation;
  late Animation<double> _menuTranslateZAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _slideAnimation =
        Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
            .animate(_controller);
    _menuScaleAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _menuTranslateZAnimation =
        Tween<double>(begin: 0, end: -math.pi / 10).animate(_controller);
  }

  void setPage(int index) {
    setState(() {
      _index = index;
    });
  }

  void toggle() {
    if (_isCollapsed) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    _isCollapsed = !_isCollapsed;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: GestureDetector(
        onTap: () => toggle(),
        child: SizedBox(
          width: _screenWidth,
          height: _screenHeight,
          child: Stack(children: [_menu(context), _dashboard(context)]),
        ),
      ),
    );
  }

  Widget _menu(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: widget.menu(context),
      ),
    );
  }

  Widget _dashboard(BuildContext context) {
    Widget dashboard = Container();
    final listDashboard = widget.dashboard(context);
    if (_index < listDashboard.length && _index > -1) {
      dashboard = listDashboard[_index];
    }
    return AnimatedPositioned(
      top: 0,
      bottom: 0,
      left: _isCollapsed ? 0 : 0.15 * _screenWidth,
      right: _isCollapsed ? 0 : -0.15 * _screenWidth,
      duration: _duration,
      child: AnimatedBuilder(
        animation: _menuTranslateZAnimation,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.rotationZ(_menuTranslateZAnimation.value),
            child: child,
          );
        },
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Material(
            clipBehavior: Clip.hardEdge,
            elevation: 8,
            borderRadius: BorderRadius.circular(20),
            child: IgnorePointer(
              child: dashboard,
              ignoring: !_isCollapsed,
            ),
          ),
        ),
      ),
    );
  }
}
