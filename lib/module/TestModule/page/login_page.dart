import 'package:flutter/material.dart';
import 'package:mvvm/core/core.dart';
import 'package:mvvm/main.dart';
import 'package:mvvm/module/TestModule/viewmodel/login_viewmodel.dart';
import 'package:mvvm/module/common/ui/primary_button.dart';
import 'package:mvvm/module/common/ui/primary_text.dart';

import '../../../core/base/base_page.dart';
import '../../../core/base/base_stateful_widget_page.dart';
import '../../../core/router/routes.dart';
import '../../common/colors.dart';
import '../../common/ui/circles_background.dart';
import '../../common/ui/primary_text_field.dart';
import '../../common/ui/underlined_button.dart';

class LoginPage extends BaseStatefulWidgetPage<LoginViewModel> {
  const LoginPage({super.key, required super.viewModel});
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _LoginPage(viewModel: viewModel);
}

class _LoginPage extends BasePage<LoginViewModel> {
  final bool _loading = false;

  _LoginPage({required super.viewModel});
  Widget _form(FocusScopeNode node, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrimaryTextField(
          textColor: AppColors.white,
          label: AppLocalizations.of(context)!.username,
          usernameField: true,
          onChanged: (value) => setState(() {
            // _username = value;
          }),
          onEditingComplete: () => node.nextFocus(),
        ),
        const SizedBox(
          height: 20,
        ),
        PrimaryTextField(
          textColor: AppColors.white,
          label: AppLocalizations.of(context)!.password,
          // controller: _passwordController,
          passwordField: true,
          onSubmitted: (_) {
            node.unfocus();

            // _login(context);
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            PrimaryText(
              text: AppLocalizations.of(context)!.signin,
              fontWeight: FontWeight.w700,
              size: 30,
            ),
            const Spacer(),
            PrimaryButton(
              radius: BorderRadius.circular(50),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              onPressed: () => {Routes.setRoot(context, RoutesPath.home)},
              loading: _loading,
              child: const Icon(Icons.arrow_forward),
            )
          ],
        ),
      ],
    );
  }

  Widget _thirdPartySignInButtons(BuildContext context) {
    return SizedBox(
      width: 270,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          PrimaryButton(
            shadowColor: AppColors.lighterGray,
            elevation: 3,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: AppColors.black,
            onPressed: () => {},
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.apple,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  PrimaryText(
                    text: AppLocalizations.of(context)!.signinWithApple,
                    color: AppColors.white,
                    size: 15,
                    fontWeight: FontWeight.w500,
                  )
                ]),
          ),
          const SizedBox(
            height: 5,
          ),
          PrimaryButton(
            shadowColor: AppColors.lighterGray,
            elevation: 3,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: AppColors.facebook,
            onPressed: () => {},
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.facebook,
                    size: 20,
                    color: AppColors.white,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  PrimaryText(
                      text: AppLocalizations.of(context)!.signinWithFacebook,
                      color: AppColors.white,
                      size: 15,
                      fontWeight: FontWeight.w500)
                ]),
          ),
          const SizedBox(
            height: 5,
          ),
          PrimaryButton(
            shadowColor: AppColors.lighterGray,
            elevation: 3,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: AppColors.google,
            onPressed: () => {},
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.android,
                    size: 20,
                    color: AppColors.white,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  PrimaryText(
                      text: AppLocalizations.of(context)!.signinWithGoogle,
                      color: AppColors.white,
                      size: 15,
                      fontWeight: FontWeight.w500)
                ]),
          ),
        ],
      ),
    );
  }

  Widget _footer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UnderlinedButton(
            onPressed: () => {
              // Navigator.pushNamed(context, RoutesPath.signup)
              Routes.push(context, RoutesPath.signup)
            },
            child: PrimaryText(
                text: AppLocalizations.of(context)!.signUp, size: 18, fontWeight: FontWeight.w700),
            color: AppColors.lightGray,
          ),
          UnderlinedButton(
            onPressed: () => {Routes.push(context, RoutesPath.forgotPassword)},
            child: PrimaryText(
              text: AppLocalizations.of(context)!.forgotPassword,
              size: 18,
              fontWeight: FontWeight.w700,
            ),
            color: AppColors.primary,
          )
        ],
      ),
    );
  }

  @override
  Widget appBody(BuildContext context) {
    final node = FocusScope.of(context);
    return CirclesBackground(
      backgroundColor: AppColors.onPrimary,
      topSmallCircleColor: AppColors.primary,
      topMediumCircleColor: AppColors.secondary,
      topRightCircleColor: AppColors.onPrimary,
      bottomRightCircleColor: AppColors.white,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Expanded(
            child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            // const AppNavigationBar(
            //   padding: EdgeInsets.only(top: 10, right: 20, bottom: 10),
            // ),
            const SizedBox(
              height: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryText(
                  text: AppLocalizations.of(context)!.welcomeBack,
                  color: AppColors.white,
                  fontWeight: FontWeight.w900,
                  size: 40,
                ),
                const SizedBox(
                  height: 50,
                ),
                _form(node, context),
                _thirdPartySignInButtons(context)
              ],
            )
          ],
        )),
        _footer(context)
      ]),
    );
  }
}
