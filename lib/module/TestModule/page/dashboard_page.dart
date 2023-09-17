import 'package:flutter/material.dart';
import 'package:mvvm/core/core.dart';
import 'package:mvvm/core/router/routes.dart';
import 'package:mvvm/main.dart';
import 'package:mvvm/module/TestModule/page/tabbar_page.dart';
import 'package:mvvm/module/common/colors.dart';
import 'package:mvvm/module/common/ui/menu_dashboard.dart';
import 'package:mvvm/module/common/ui/primary_text.dart';

import '../../../gen/assets.gen.dart';
import '../../common/ui/underlined_button.dart';

class DataMenu {
  final IconData icon;
  final String title;
  final bool isBadge;
  DataMenu(this.icon, this.title, {this.isBadge = false});
}

// ignore: must_be_immutable
class DasboardPage extends MenuDashboard {
  DasboardPage({ super.key });
  var _index = 0;
  List<DataMenu> arrDataMenu = [];
  @override
  List<Widget> dashboard(BuildContext context) {
    return [TabbarPage()];
  }

  @override
  Widget? menu(BuildContext context) {
     arrDataMenu = [
        DataMenu(Icons.apps, AppLocalizations.of(context)!.dashboard),
        DataMenu(Icons.newspaper, AppLocalizations.of(context)!.news),
        DataMenu(Icons.history, AppLocalizations.of(context)!.history),
        DataMenu(Icons.call, AppLocalizations.of(context)!.contact),
        DataMenu(Icons.store, AppLocalizations.of(context)!.store),
        DataMenu(Icons.settings, AppLocalizations.of(context)!.setting)
    ];
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 20),
      width: 200,
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
            GestureDetector(
              onTap: () {
              },
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  PrimaryText(
                    text: "Truc Pham",
                    fontWeight: FontWeight.w700,
                    size: 22,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Icon(
                      Icons.navigate_next_outlined,
                      size: 20,
                    ),
                  )
                ],
              ),
            ),
            const PrimaryText(
              text: "Mobile Developer",
              color: AppColors.onSecondary,
              fontWeight: FontWeight.w500,
              size: 12,
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Column(
                  children: List<UnderlinedButton>.generate(arrDataMenu.length,
                      (index) {
                final item = arrDataMenu[index];
                return UnderlinedButton(
                    color: _index == index
                        ? AppColors.lightGray
                        : Colors.transparent,
                    onPressed: () {
                      _index = index;
                      getCurrentState(context).setPage(index);
                      getCurrentState(context).reloadMenu();
                    },
                    child: Row(
                      children: [
                        Icon(
                          item.icon,
                          size: 20,
                          color: _index == index
                              ? AppColors.white
                              : AppColors.secondary,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        PrimaryText(
                          text: item.title,
                          size: 18,
                          fontWeight: FontWeight.w500,
                          color: _index == index
                              ? AppColors.white
                              : AppColors.secondary,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        item.isBadge
                            ? Container(
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                    color: AppColors.red,
                                    borderRadius: BorderRadius.circular(6)),
                              )
                            : Container()
                      ],
                    ));
              })),
            ),
            GestureDetector(
              child:  Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.language,
                    size: 20,
                    color: AppColors.black,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  PrimaryText(
                    text: AppLocalizations.of(context)!.changeLanguage,
                    size: 18,
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
              onTap: () {
                MyApp.setLocale(context, Language.vi);

              },
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.logout_outlined,
                    size: 20,
                    color: AppColors.black,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  PrimaryText(
                    text: AppLocalizations.of(context)!.logout,
                    size: 18,
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
              onTap: () {
                Routes.setRoot(context, RoutesPath.signin);

              },
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
