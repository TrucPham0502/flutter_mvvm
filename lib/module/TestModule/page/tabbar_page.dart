import 'package:flutter/material.dart';
import 'package:mvvm/core/injection/injection.dart';
import 'package:mvvm/module/TestModule/page/home_page.dart';
import 'package:mvvm/module/common/colors.dart';

import '../../../core/base/base_stateful_widget_page.dart';
import '../../common/ui/bottom_navy_bar.dart';
import 'empty_page.dart';

// ignore: must_be_immutable
class TabbarPage extends StatefulWidget {
  TabbarPage({Key? key}) : super(key: key);
  List<BaseStatefulWidgetPage> pages = [
    getIt.get<MyHomePage>(),
    getIt.get<EmptyPage>(),
    getIt.get<EmptyPage>(),
    getIt.get<EmptyPage>(),
  ];
  @override
  State<StatefulWidget> createState() => _TabbarPage();
}

class _TabbarPage extends State<TabbarPage> {
  var _currentIndex = 0;
  List<BaseStatefulWidgetPage> pages = [];
  final List<bool> shouldBuildTab = <bool>[];
  @override
  void initState() {
    super.initState();
    pages = widget.pages;
    shouldBuildTab.addAll(List<bool>.filled(pages.length, false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: List<Widget>.generate(pages.length, (index) {
            final bool active = index == _currentIndex;
            shouldBuildTab[index] = active || shouldBuildTab[index];
            return HeroMode(
              enabled: active,
              child: Offstage(
                offstage: !active,
                child: shouldBuildTab[index]
                    ? pages.elementAt(index)
                    : Container(),
              ),
            );
          }),
        ),
        bottomNavigationBar: BottomNavyBar(
          animationDuration: const Duration(milliseconds: 200),
          selectedIndex: _currentIndex,
          showElevation: true,
          itemCornerRadius: 20,
          curve: Curves.easeIn,
          onItemSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: const Icon(Icons.apps),
              title: const Text('Home'),
              activeColor: AppColors.primary,
              inactiveColor: AppColors.secondary,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.discount),
              title: const Text('Discount'),
              activeColor: AppColors.primary,
              inactiveColor: AppColors.secondary,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.notifications_active),
              title: const Text('Notification'),
              activeColor: AppColors.primary,
              inactiveColor: AppColors.secondary,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.shopping_cart),
              title: const Text('Cart'),
              activeColor: AppColors.primary,
              inactiveColor: AppColors.secondary,
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
// CupertinoTabScaffold(
//         tabBar: CupertinoTabBar(items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.card_travel), label: "Adventure"),
//           BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.collections_bookmark), label: "Bookmarks"),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: "Bookmarks"),
//         ]),
//         tabBuilder: (context, index) {
//           return CupertinoTabView(
//             builder: (context) {
//               return pages.elementAt(index);
//             },
//           );
//         });