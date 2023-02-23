import 'package:flutter/material.dart';
import 'package:mvvm/module/common/colors.dart';
import 'dart:math' as math;

import 'package:rxdart/subjects.dart';

abstract class MenuDashboard extends StatefulWidget {
  static _MenuDashboard of(BuildContext context, {bool root = false}) => root
      ? context.findRootAncestorStateOfType<_MenuDashboard>() as _MenuDashboard
      : context.findAncestorStateOfType<_MenuDashboard>() as _MenuDashboard;

  _MenuDashboard getCurrentState(BuildContext context) =>
      ((context as StatefulElement).state as _MenuDashboard);
  Widget? menu(BuildContext context);
  List<Widget> dashboard(BuildContext context);
  Widget? header(BuildContext context) {
    return null;
  }

  const MenuDashboard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MenuDashboard();
}

class _MenuDashboard extends State<MenuDashboard>
    with TickerProviderStateMixin {
  final List<bool> shouldBuildTab = <bool>[];
  var _screenWidth = 0.0;
  var _screenHeight = 0.0;
  final _duration = const Duration(milliseconds: 100);
  var _isCollapsed = true;
  var _index = 0;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _menuTranslateZAnimation;
  final PublishSubject _menuStream = PublishSubject();
  final PublishSubject _dashboardStream = PublishSubject();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _slideAnimation =
        Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
            .animate(_controller);
    _menuTranslateZAnimation =
        Tween<double>(begin: 0, end: 10 * math.pi / 180).animate(_controller);
    shouldBuildTab
        .addAll(List<bool>.filled(widget.dashboard(context).length, false));
  }

  void setPage(int index) {
    _index = index;
    close();
  }

  void reload() {
    setState(() {});
  }

  void reloadMenu() {
    _menuStream.add(1);
  }

  void reloadDashboard() {
    _dashboardStream.add(1);
  }

  void toggle() {
    if (_isCollapsed) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    _isCollapsed = !_isCollapsed;
    reload();
  }

  void close() {
    _controller.reverse();
    _isCollapsed = true;
    reload();
  }

  void open() {
    _controller.forward();
    _isCollapsed = false;
    reload();
  }

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.onPrimary,
      body: GestureDetector(
        onTap: () => close(),
        child: Container(
          decoration: const BoxDecoration(color: AppColors.primary),
          width: _screenWidth,
          height: _screenHeight,
          child: Stack(children: [
            StreamBuilder(
                stream: _menuStream,
                builder: (_context, snap) {
                  return _menu(context);
                }),
            StreamBuilder(
                stream: _dashboardStream,
                builder: (_context, snap) {
                  return _dashboard(context);
                })
          ]),
        ),
      ),
    );
  }

  Widget _menu(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: widget.menu(context),
    );
  }

  Widget _dashboard(BuildContext context) {
    final listDashboard = widget.dashboard(context);
    return AnimatedPositioned(
      top: 0,
      bottom: 0,
      left: _isCollapsed ? 0 : 0.6 * _screenWidth,
      right: _isCollapsed ? 0 : -0.6 * _screenWidth,
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
            borderRadius:
                _isCollapsed ? BorderRadius.zero : BorderRadius.circular(20),
            child: IgnorePointer(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.header(context) ?? Container(),
                    Expanded(
                      child: Stack(
                        fit: StackFit.expand,
                        children: List<Widget>.generate(listDashboard.length,
                            (index) {
                          final bool active = index == _index;
                          shouldBuildTab[index] =
                              active || shouldBuildTab[index];
                          return HeroMode(
                            enabled: active,
                            child: Offstage(
                              offstage: !active,
                              child: shouldBuildTab[index]
                                  ? listDashboard.elementAt(index)
                                  : Container(),
                            ),
                          );
                        }),
                      ),
                    )
                  ]),
              ignoring: !_isCollapsed,
            ),
          ),
        ),
      ),
    );
  }
}
