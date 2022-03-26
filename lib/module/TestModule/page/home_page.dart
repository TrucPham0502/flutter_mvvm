import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvvm/module/TestModule/model/home_response.dart';
import 'package:mvvm/module/TestModule/page/detail_page.dart';
import 'package:rxdart/rxdart.dart';

import '../../../core/base/base_state_page.dart';
import '../../../core/base/base_stateful_widget_page.dart';
import '../viewmodel/home_viewmodel.dart';

class MyHomePage extends BaseStatefulWidgetPage {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends BaseStatePage<HomeViewModel, HomeViewModelInput,
    HomeViewModelOutput, MyHomePage> {
  final _textSearchController = TextEditingController();
  final textSearch = PublishSubject<String>();
  List<HomeResponse> data = [];
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
    super.dispose();
  }

  @override
  PreferredSizeWidget appBar(BuildContext context) {
    return AppBar(title: Text(widget.title), actions: <Widget>[
      FlatButton(
        textColor: Colors.white,
        onPressed: () {
          log("ssssss");
        },
        child: Text("Save"),
        shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
      ),
    ]);
  }

  @override
  Widget appBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: TextField(
            controller: _textSearchController,
            onChanged: (text) {
              textSearch.add(text);
            },
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: "Search...",
            ),
          ),
        ),
        Expanded(
          child: StreamBuilder<List<HomeResponse>>(
            initialData: const [],
            stream: output.items,
            builder: (context, snapShot) {
              data = snapShot.data!;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final d = data[index];
                    return ListTile(
                      title: Text(d.title),
                      leading: Container(
                        alignment: Alignment.center,
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            image: DecorationImage(
                                image: NetworkImage(d.thumbnailUrl),
                                fit: BoxFit.cover)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage(data: d)));
                      },
                    );
                  });
            },
          ),
        ),
      ],
    );
  }
}
