import 'package:flutter/material.dart';
import 'package:mvvm/module/TestModule/viewmodel/register_viewmodel.dart';
import 'package:mvvm/module/common/ui/navigation_bar.dart';

import '../../../core/base/base_page.dart';
import '../../../core/base/base_stateful_widget_page.dart';
import '../../../core/router/routes.dart';
import '../../common/colors.dart';
import '../../common/ui/circles_background.dart';
import '../../common/ui/primary_button.dart';
import '../../common/ui/primary_text.dart';
import '../../common/ui/primary_text_field.dart';
import '../../common/ui/underlined_button.dart';

class RegisterPage extends BaseStatefulWidgetPage<RegisterViewModel> {
  const RegisterPage({super.key, required super.viewModel});
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _RegisterPage(viewModel: viewModel);
}

class _RegisterPage extends BasePage<RegisterViewModel> {
  late RegisterViewModelOutput output;

  _RegisterPage({required super.viewModel});


  @override
  void performBinding() {
    super.performBinding();
    final input = RegisterViewModelInput();
    output = viewModel.transform(input);
  }

  Widget _form(FocusScopeNode node, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrimaryTextField(
          textColor: AppColors.white,
          label: 'Username',
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
            label: 'Email',
            emailField: true,
            onEditingComplete: () => node.nextFocus()),
        const SizedBox(
          height: 20,
        ),
        PrimaryTextField(
          textColor: AppColors.white,
          label: 'Password',
          // controller: _passwordController,
          passwordField: true,
          onSubmitted: (_) {
            node.unfocus();
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const PrimaryText(
              text: 'Sign Up',
              fontWeight: FontWeight.w700,
              size: 30,
            ),
            const Spacer(),
            PrimaryButton(
              radius: BorderRadius.circular(50),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              onPressed: () => {},
              loading: false,
              child: const Icon(Icons.arrow_forward),
            )
          ],
        ),
      ],
    );
  }

  Widget _footer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          UnderlinedButton(
            onPressed: () => {
              Routes.push(context, RoutesPath.signin)
            },
            child: const PrimaryText(
                text: 'Sign In', size: 18, fontWeight: FontWeight.w700),
            color: AppColors.lightGray,
          ),
        ],
      ),
    );
  }

  Widget _thirdPartySignInButtons(BuildContext context) {
    return SizedBox(
      width: 230,
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
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.apple,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  PrimaryText(
                    text: "Sign up with Apple",
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
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.facebook,
                    size: 20,
                    color: AppColors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  PrimaryText(
                      text: "Sign up with Facebook",
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
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.android,
                    size: 20,
                    color: AppColors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  PrimaryText(
                      text: "Sign up with Google",
                      color: AppColors.white,
                      size: 15,
                      fontWeight: FontWeight.w500)
                ]),
          ),
        ],
      ),
    );
  }

  @override
  Widget appBody(BuildContext context) {
    final node = FocusScope.of(context);
    return CirclesBackground(
        backgroundColor: AppColors.onPrimary,
        topSmallCircleColor: AppColors.secondary,
        topMediumCircleColor: AppColors.secondary,
        topRightCircleColor: AppColors.onPrimary,
        bottomRightCircleColor: AppColors.primary,
        child: Stack(children: [
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Expanded(
                child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: [
                  const AppNavigationBar(
                    padding: EdgeInsets.only(top: 10, right: 20, bottom: 10),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const PrimaryText(
                        text: "Create Account",
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
                ])),
            _footer(context)
          ])
        ]));
  }
}
