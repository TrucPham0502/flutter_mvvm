import 'package:flutter/material.dart';
import 'package:mvvm/module/TestModule/page/home_page.dart';
import 'package:mvvm/module/TestModule/page/recover_page.dart';
import 'package:mvvm/module/common/colors.dart';
import 'package:mvvm/module/common/ui/menu_dashboard.dart';
import 'package:mvvm/module/common/ui/primary_text.dart';

import '../../../gen/assets.gen.dart';
import '../../common/ui/underlined_button.dart';

class DataMenu {
  final IconData icon;
  final String title;
  DataMenu(this.icon, this.title);
}

class DasboardPage extends MenuDashboard {
  DasboardPage({Key? key}) : super(key: key);
  var index = 0;
  List<DataMenu> arrDataMenu = [
    DataMenu(Icons.dashboard, "Dashboard"),
    DataMenu(Icons.shopping_cart, "Cart"),
  ];
  @override
  List<Widget> dashboard(BuildContext context) {
    return const [MyHomePage(), RecoverPage()];
  }

  @override
  Widget? menu(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, top: 30),
      width: 180,
      decoration: const BoxDecoration(color: AppColors.primary),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(Assets.images.man.path),
            ),
            const SizedBox(
              height: 15,
            ),
            const PrimaryText(
              text: "Truc Pham",
              fontWeight: FontWeight.w700,
              size: 22,
            ),
            const PrimaryText(
              text: "Mobile Developer",
              color: AppColors.onSecondary,
              fontWeight: FontWeight.w500,
              size: 12,
            ),
            const SizedBox(
              height: 30,
            ),
            UnderlinedButton(
                color: index == 0 ? AppColors.lightGray : Colors.transparent,
                onPressed: () {
                  index = 0;
                  getCurrentState(context).setPage(index);
                  getCurrentState(context).reloadMenu();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.dashboard,
                      size: 20,
                      color: index == 0 ? AppColors.white : AppColors.secondary,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    PrimaryText(
                      text: 'Dashboard',
                      size: 18,
                      fontWeight: FontWeight.w500,
                      color: index == 0 ? AppColors.white : AppColors.secondary,
                    ),
                  ],
                )),
            UnderlinedButton(
                color: index == 1 ? AppColors.lightGray : Colors.transparent,
                onPressed: () {
                  index = 1;
                  getCurrentState(context).setPage(index);
                  getCurrentState(context).reloadMenu();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      size: 20,
                      color: index == 1 ? AppColors.white : AppColors.secondary,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    PrimaryText(
                      text: "Cart",
                      size: 18,
                      color: index == 1 ? AppColors.white : AppColors.secondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: GestureDetector(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Icon(
                      Icons.logout_outlined,
                      size: 20,
                      color: AppColors.black,
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    PrimaryText(
                      text: "Logout",
                      size: 18,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
                onTap: () {},
              ),
            ))
          ],
        ),
      ),
    );
  }
}
