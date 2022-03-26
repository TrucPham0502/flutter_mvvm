import 'package:flutter/material.dart';
import 'package:mvvm/core/base/base_stateful_widget_page.dart';
import 'package:mvvm/module/TestModule/model/home_response.dart';

import '../../../core/base/base_state_page.dart';
import '../viewmodel/detail_viewmodel.dart';

class DetailPage extends BaseStatefulWidgetPage<DetailViewModel> {
  DetailPage({Key? key, required this.data}) : super(key: key);
  HomeResponse data;
  @override
  State<StatefulWidget> createState() => _DetailPageState();

  @override
  DetailViewModel get viewModel => DetailViewModel();
}

class _DetailPageState extends BaseStatePage<DetailViewModel,
    DetailViewModelInput, DetailViewModelOutput, DetailPage> {
  @override
  PreferredSizeWidget appBar(BuildContext context) {
    return AppBar(
      title: Text("${widget.data.id}"),
    );
  }

  @override
  DetailViewModelInput makeInput() {
    return DetailViewModelInput();
  }

  @override
  Widget appBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(
          widget.data.url,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Text(widget.data.title)
      ],
    );
  }
}
