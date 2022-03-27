import 'package:flutter/material.dart';
import 'package:mvvm/module/TestModule/model/home_response.dart';
import 'package:mvvm/core/core.dart';
import '../viewmodel/detail_viewmodel.dart';

class DetailPage extends BaseStatefulWidgetPage {
  final HomeResponse data;
  const DetailPage({Key? key, required this.data}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _DetailPageState();
}

class _DetailPageState extends BaseStatePage<DetailViewModel,
    DetailViewModelInput, DetailViewModelOutput, DetailPage> {
  @override
  PreferredSizeWidget appBar(BuildContext context) {
    return AppBar(
        // title: Text(AppLocalizations.of(context)!.helloWorld),
        );
  }

  @override
  DetailViewModel makeViewModel() {
    return DetailViewModel();
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
