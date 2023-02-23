import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm/core/core.dart';
import 'package:mvvm/module/TestModule/viewmodel/empty_viewmodel.dart';

class EmptyPage extends BaseStatefulWidgetPage {
  @override
  State<StatefulWidget> createState() => _EmptyPage();
}

class _EmptyPage extends BaseStatePage<EmptyPageViewModel, EmptyPageInput,
    EmptyPageOutput, EmptyPage> {
  @override
  EmptyPageInput makeInput() {
    return EmptyPageInput();
  }

  @override
  EmptyPageViewModel makeViewModel() {
    return EmptyPageViewModel();
  }
}
