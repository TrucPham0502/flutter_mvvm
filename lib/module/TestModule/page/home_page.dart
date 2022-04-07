import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvvm/module/TestModule/page/detail_page.dart';
import 'package:mvvm/module/TestModule/page/login_page.dart';
import 'package:mvvm/module/common/colors.dart';
import 'package:mvvm/gen/assets.gen.dart';
import 'package:mvvm/module/common/ui/menu_dashboard.dart';
import 'package:rxdart/rxdart.dart';
import 'package:mvvm/core/core.dart';
import '../../common/ui/circles_background.dart';
import '../../common/ui/primary_text.dart';
import '../model/home_response.dart';
import '../viewmodel/home_viewmodel.dart';

class MyHomePage extends BaseStatefulWidgetPage {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends BaseStatePage<HomeViewModel, HomeViewModelInput,
    HomeViewModelOutput, MyHomePage> with TickerProviderStateMixin {
  final _textSearchController = TextEditingController();
  final textSearch = PublishSubject<String>();
  final scrollController = ScrollController();
  final PageController headerScrollController =
      PageController(viewportFraction: 0.4, initialPage: 0);
  List<HomeResponse> data = [];
  int selectedFoodCard = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  HomeViewModel makeViewModel() {
    return HomeViewModel();
  }

  @override
  HomeViewModelInput makeInput() {
    return HomeViewModelInput(textSearch, viewDidApearing);
  }

  @override
  void dispose() {
    _textSearchController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  // @override
  // PreferredSizeWidget appBar(BuildContext context) {
  //   return AppBar(
  //     backgroundColor: AppColors.onPrimary,
  //     centerTitle: false,
  //     elevation: 0.5,
  //     actions: [
  //       ,
  //       const SizedBox(
  //         width: 20,
  //       )
  //     ],
  //   );
  // }

  Widget _category(BuildContext context) {
    return SizedBox(
        height: 240,
        child: StreamBuilder<List<FoodCategory>>(
          initialData: const [],
          stream: output.foodCategoryitems.subject,
          builder: (context, snapshot) {
            return PageView.builder(
                allowImplicitScrolling: true,
                onPageChanged: (int index) =>
                    {setState(() => selectedFoodCard = index)},
                physics: const PageScrollPhysics(),
                controller: headerScrollController,
                scrollDirection: Axis.horizontal,
                itemCount: output.foodCategoryitems.value.length,
                itemBuilder: (context, index) {
                  var item = output.foodCategoryitems.value[index];
                  List<int> indexAnimateds = [selectedFoodCard];
                  if (headerScrollController.position.userScrollDirection ==
                      ScrollDirection.forward) {
                    indexAnimateds.add(selectedFoodCard + 1);
                  } else {
                    indexAnimateds.add(selectedFoodCard - 1);
                  }

                  return ScaleTransition(
                    scale: Tween<double>(
                            begin: index == selectedFoodCard ? 0.9 : 1,
                            end: index == selectedFoodCard ? 1 : 0.9)
                        .animate(AnimationController(
                            vsync: this,
                            duration: Duration(
                                milliseconds:
                                    indexAnimateds.contains(index) ? 300 : 0))
                          ..forward()),
                    child: GestureDetector(
                      onTap: () {
                        // setState(() => selectedFoodCard = index);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            right: 20, top: 20, bottom: 20),
                        padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: selectedFoodCard == index
                                ? AppColors.primary
                                : AppColors.white,
                            boxShadow: const [
                              BoxShadow(
                                  color: AppColors.lighterGray, blurRadius: 15)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              item.image,
                              width: 40,
                            ),
                            PrimaryText(
                              text: item.name,
                              fontWeight: FontWeight.w800,
                              size: 16,
                            ),
                            RawMaterialButton(
                              onPressed: null,
                              fillColor: selectedFoodCard == index
                                  ? AppColors.white
                                  : AppColors.tertiary,
                              shape: const CircleBorder(),
                              child: Icon(
                                Icons.chevron_left_rounded,
                                size: 20,
                                color: selectedFoodCard == index
                                    ? AppColors.black
                                    : AppColors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
          },
        ));
  }

  Widget _popular(BuildContext context) {
    return StreamBuilder(
        stream: output.popularFoodItems.subject,
        builder: (context, snapshot) {
          return ListView.builder(
              shrinkWrap: true,
              controller: scrollController,
              itemCount: output.popularFoodItems.value.length,
              itemBuilder: (context, index) {
                var item = output.popularFoodItems.value[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              DetailPage(
                            data: item,
                          ),
                        ));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 25, left: 10, top: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(blurRadius: 10, color: AppColors.lighterGray)
                      ],
                      color: AppColors.white,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 25, left: 20, bottom: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Icon(
                                        Icons.star,
                                        size: 20,
                                        color: AppColors.primary,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      PrimaryText(
                                        text: "top of the week",
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  PrimaryText(
                                    text: item.name,
                                    size: 22,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  PrimaryText(
                                      text: item.weight,
                                      size: 18,
                                      color: AppColors.lightGray),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Container(
                                    child: const Icon(
                                      Icons.add,
                                      size: 20,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 45, vertical: 20),
                                    decoration: const BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          topRight: Radius.circular(20)),
                                    )),
                                const SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  child: Row(
                                    children: [
                                      const Icon(Icons.star, size: 12),
                                      const SizedBox(width: 5),
                                      PrimaryText(
                                        text: item.star.toString(),
                                        size: 18,
                                        fontWeight: FontWeight.w600,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                        Container(
                          transform: Matrix4.translationValues(20.0, 25.0, 0.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey[400]!, blurRadius: 20)
                              ]),
                          child: Hero(
                            tag: item.image,
                            child: Image.asset(item.image,
                                width: MediaQuery.of(context).size.width / 2.9),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        });
  }

  @override
  Widget appBody(BuildContext context) {
    return CirclesBackground(
        isSafeAreaBottom: false,
        backgroundColor: AppColors.onPrimary,
        topSmallCircleColor: AppColors.onPrimary,
        topMediumCircleColor: AppColors.onPrimary,
        topRightCircleColor: AppColors.onPrimary,
        bottomRightCircleColor: AppColors.lightGray,
        child: Column(children: [
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: Assets.images.man,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        MenuDashboard.of(context).toggle();
                      },
                      icon: SvgPicture.asset(Assets.images.menu))
                ]),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: PrimaryText(
                                text: "Food",
                                size: 22,
                              )),
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: PrimaryText(
                              text: "Delivery",
                              height: 1.1,
                              size: 42,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                Icons.search,
                                color: AppColors.secondary,
                                size: 25,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextField(
                                    decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 2,
                                              color: AppColors.lightGray),
                                        ),
                                        hintText: 'Search...',
                                        hintStyle: TextStyle(
                                            color: AppColors.lightGray,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500))),
                              ),
                              SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                          const SizedBox(height: 25),
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: PrimaryText(
                              text: "Categories",
                              size: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          _category(context),
                        ]),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, bottom: 15),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 10, left: 20),
                            child: PrimaryText(
                              text: "Popular",
                              fontWeight: FontWeight.w700,
                              size: 22,
                            ),
                          ),
                          _popular(context)
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
