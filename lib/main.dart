import 'package:mvvm/data_model.dart';

import 'injection.dart';

import 'package:flutter/material.dart';
import 'package:mvvm/base.dart';
import 'package:mvvm/mainviewmodel.dart';
import 'extension.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends BaseStatefulWidgetPage<MainViewModel> {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  @override
  MainViewModel get viewModel => MainViewModel();
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends BaseStatePage<MainViewModel, MyHomePage> {
  final _textSearchController = TextEditingController();
  final textSearch = PublishSubject<String>();
  List<Album> data = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  void performBinding() {
    super.performBinding();
    final output = viewModel.transform(MainViewModelInput(textSearch));
    output.items.listen((event) {
      setState(() {
        data = event;
      });
    }).canceledBy(this);
  }

  @override
  void dispose() {
    _textSearchController.dispose();
    super.dispose();
  }

  @override
  PreferredSizeWidget appBar(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
    );
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
          child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index].title),
                );
              }),
        ),
      ],
    );
  }
}
