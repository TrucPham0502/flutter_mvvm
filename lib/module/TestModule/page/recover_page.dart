import 'package:flutter/material.dart';
import 'package:mvvm/module/TestModule/viewmodel/recover_viewmodel.dart';
import 'package:mvvm/module/common/ui/circles_background.dart';

import '../../../core/base/base_page.dart';
import '../../../core/base/base_stateful_widget_page.dart';
import '../../common/colors.dart';
import '../../common/ui/navigation_bar.dart';
import '../../common/ui/primary_button.dart';
import '../../common/ui/primary_text.dart';
import '../../common/ui/primary_text_field.dart';

class RecoverPage extends BaseStatefulWidgetPage<RecoverViewModel> {
  const RecoverPage({super.key, required super.viewModel});


  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _RecoverPage(viewModel: viewModel);
}

class _RecoverPage extends BasePage<RecoverViewModel> {
  late RecoverViewModelOutput output;

  _RecoverPage({required super.viewModel});


  @override
  void performBinding() {
    // TODO: implement performBinding
    super.performBinding();
    final input = RecoverViewModelInput();
    output = viewModel.transform(input);
  }

  Widget _form(FocusScopeNode node, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrimaryTextField(
            textColor: AppColors.white,
            label: 'Email',
            emailField: true,
            onChanged: (value) => setState(() {
                  // _username = value;
                }),
            onSubmitted: (_) {
              node.unfocus();
            }),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const PrimaryText(
              text: 'Recover',
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

  @override
  Widget appBody(BuildContext context) {
    final node = FocusScope.of(context);
    return CirclesBackground(
      backgroundColor: AppColors.onPrimary,
      topSmallCircleColor: AppColors.primary,
      topMediumCircleColor: AppColors.secondary,
      topRightCircleColor: AppColors.onPrimary,
      bottomRightCircleColor: AppColors.onPrimary,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Expanded(
            child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const AppNavigationBar(
              padding: EdgeInsets.only(top: 10, right: 20, bottom: 10),
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PrimaryText(
                  text: "Forgot Password",
                  color: AppColors.white,
                  fontWeight: FontWeight.w900,
                  size: 40,
                ),
                const SizedBox(
                  height: 50,
                ),
                _form(node, context),
              ],
            )
          ],
        )),
      ]),
    );
  }
}
