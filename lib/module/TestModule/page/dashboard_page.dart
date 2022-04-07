import 'package:flutter/material.dart';
import 'package:mvvm/module/TestModule/page/home_page.dart';
import 'package:mvvm/module/common/colors.dart';
import 'package:mvvm/module/common/ui/menu_dashboard.dart';
import 'package:mvvm/module/common/ui/primary_text.dart';

import '../../../gen/assets.gen.dart';

class DasboardPage extends MenuDashboard {
  const DasboardPage({Key? key}) : super(key: key);

  @override
  List<Widget> dashboard(BuildContext context) {
    return const [MyHomePage()];
  }

  @override
  Widget? menu(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 30),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: AppColors.primary),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
              fontWeight: FontWeight.w500,
              size: 22,
            )
          ],
        ),
      ),
    );
  }
}
