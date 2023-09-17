import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvvm/gen/assets.gen.dart';
import 'package:mvvm/module/TestModule/model/home_response.dart';
import 'package:mvvm/module/common/ui/navigation_bar.dart';
import 'package:mvvm/module/common/ui/primary_button.dart';

import '../../../core/base/base_page.dart';
import '../../../core/base/base_stateful_widget_page.dart';
import '../../../core/router/routes.dart';
import '../../../main.dart';
import '../../common/colors.dart';
import '../../common/ui/circles_background.dart';
import '../../common/ui/primary_text.dart';
import '../viewmodel/detail_viewmodel.dart';

// ignore: must_be_immutable
class DetailPage extends BaseStatefulWidgetPage<DetailViewModel> {
  late PopularFoodList data;
  DetailPage({super.key, required super.viewModel});
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _DetailPageState(data, viewModel: viewModel);
}

class _DetailPageState extends BasePage<DetailViewModel> {
  final PopularFoodList data;
  late DetailViewModelOutput output;

  _DetailPageState(this.data, {required super.viewModel});
  @override
  void performBinding() {
    super.performBinding();
    final input = DetailViewModelInput(stateLoaded);
    output = viewModel.transform(input);
  }

  @override
  Widget appBody(BuildContext context) {
    return CirclesBackground(
        isSafeAreaTop: false,
        isSafeAreaBottom: false,
        isSafeAreaLeft: false,
        isSafeAreaRight: false,
        backgroundColor: AppColors.onPrimary,
        topSmallCircleColor: AppColors.onPrimary,
        topMediumCircleColor: AppColors.onPrimary,
        topRightCircleColor: AppColors.onPrimary,
        bottomRightCircleColor: AppColors.lightGray,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: ListView(
                children: [
                  ///Appbar
                  const AppNavigationBar(
                    backColor: AppColors.black,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(
                      Icons.star,
                      color: AppColors.primary,
                      size: 35,
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  /// body
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: PrimaryText(
                          text: data.name,
                          size: 45,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              Assets.images.dollar,
                              color: AppColors.tertiary,
                              width: 15,
                            ),
                            PrimaryText(
                              text: data.price.toString(),
                              size: 48,
                              fontWeight: FontWeight.w700,
                              color: AppColors.tertiary,
                              height: 1,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    PrimaryText(
                                      text: 'Size',
                                      color: AppColors.lightGray,
                                      size: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    PrimaryText(
                                        text: 'Medium 14',
                                        fontWeight: FontWeight.w600),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    PrimaryText(
                                      text: 'Crust',
                                      color: AppColors.lightGray,
                                      size: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    PrimaryText(
                                        text: 'Thin Crust',
                                        fontWeight: FontWeight.w600),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    PrimaryText(
                                      text: 'Delivery in',
                                      color: AppColors.lightGray,
                                      size: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    PrimaryText(
                                        text: '30 min',
                                        fontWeight: FontWeight.w600),
                                  ]),
                            ),
                            Hero(
                              tag: data.image,
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey[400]!,
                                        blurRadius: 30),
                                  ],
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                height: 200,
                                child:
                                    Image.asset(data.image, fit: BoxFit.cover),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: PrimaryText(
                            text: 'Ingredients',
                            fontWeight: FontWeight.w700,
                            size: 22),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                          height: 100,
                          child: StreamBuilder<List<Ingredients>>(
                            initialData: [],
                            stream: output.ingredients.asStream(),
                            builder: (context, snap) => ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: output.ingredients.value.length,
                              itemBuilder: (context, index) {
                                var item = output.ingredients.value[index];
                                return Padding(
                                    padding: EdgeInsets.only(
                                        left: index == 0 ? 20 : 0,
                                        top: 10,
                                        bottom: 10),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 15),
                                      margin: const EdgeInsets.only(
                                        right: 20,
                                      ),
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 10,
                                              color: Colors.grey[300]!)
                                        ],
                                        borderRadius: BorderRadius.circular(20),
                                        color: AppColors.white,
                                      ),
                                      child: Image.asset(item.image, width: 90),
                                    ));
                              },
                            ),
                          ))
                    ],
                  )
                ],
              )),
              SafeArea(
                  top: false,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width - 40,
                    ),
                    child: PrimaryButton(
                      onPressed: () => {
                        Routes.push(context, RoutesPath.cart)
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          PrimaryText(
                            text: 'Place an Order',
                            fontWeight: FontWeight.w600,
                            size: 18,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 3),
                            child: Icon(Icons.chevron_right,
                                color: AppColors.black),
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}
