import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvvm/module/TestModule/viewmodel/cart_viewmodel.dart';
import 'package:mvvm/module/common/ui/circles_background.dart';
import 'package:mvvm/module/common/ui/navigation_bar.dart';
import 'package:mvvm/module/common/ui/primary_button.dart';
import 'package:mvvm/module/common/ui/primary_text.dart';

import '../../../core/base/base_page.dart';
import '../../../core/base/base_stateful_widget_page.dart';
import '../../../gen/assets.gen.dart';
import '../../common/colors.dart';

class CartPage extends BaseStatefulWidgetPage<CartPageViewModel> {
  const CartPage({super.key, required super.viewModel});
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _CartPage(viewModel: viewModel);
}

class _CartPage extends BasePage<CartPageViewModel> {
  late CartPageOutput output;

  _CartPage({required super.viewModel});

  @override
  void performBinding() {
    super.performBinding();
    final input = CartPageInput(stateLoaded);
    output = viewModel.transform(input);
  }

  @override
  Widget appBody(BuildContext context) {
    return CirclesBackground(
        backgroundColor: AppColors.onPrimary,
        topSmallCircleColor: AppColors.onPrimary,
        topMediumCircleColor: AppColors.onPrimary,
        topRightCircleColor: AppColors.onPrimary,
        bottomRightCircleColor: AppColors.lightGray,
        child: Column(children: [
          const AppNavigationBar(
            backColor: AppColors.black,
            padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: StreamBuilder(
              builder: (c, s) {
                return ListView.builder(
                    itemCount: output.items.value.length,
                    itemBuilder: (_c, index) {
                      final item = output.items.value[index];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                              item.image,
                              width: 80,
                              height: 80,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PrimaryText(
                                text: item.name,
                                size: 20,
                                color: AppColors.secondary,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    Assets.images.dollar,
                                    color: AppColors.tertiary,
                                    width: 14,
                                  ),
                                  PrimaryText(
                                    text: "${item.price} x${item.quantity}",
                                    color: AppColors.tertiary,
                                    size: 16,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      );
                    });
              },
              stream: output.items.asStream(),
              initialData: const [],
            ),
          )),
          Container(
            decoration:
                BoxDecoration(color: AppColors.onPrimary.withOpacity(0.7)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            color: AppColors.lighterGray,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Icon(
                          Icons.discount,
                          size: 20,
                          color: AppColors.tertiary,
                        ),
                      ),
                      const Row(
                        children: [
                          PrimaryText(
                            text: "Add voucher code",
                            size: 15,
                            color: AppColors.onSecondary,
                          ),
                          Icon(
                            Icons.navigate_next,
                            size: 17,
                            color: AppColors.onSecondary,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        children: [
                          PrimaryText(
                            text: "Total:",
                            size: 15,
                            color: AppColors.onSecondary,
                          ),
                          PrimaryText(
                            text: "33.15",
                            size: 17,
                            color: AppColors.secondary,
                          ),
                        ],
                      ),
                      PrimaryButton(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 60),
                        onPressed: () {},
                        child: const PrimaryText(
                          text: "Check Out",
                          size: 17,
                          color: AppColors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ]));
  }
}
