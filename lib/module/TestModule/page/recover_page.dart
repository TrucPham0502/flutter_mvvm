import 'package:flutter/material.dart';
import 'package:mvvm/core/core.dart';
import 'package:mvvm/module/TestModule/viewmodel/recover_viewmodel.dart';

class RecoverPage extends BaseStatefulWidgetPage {
  const RecoverPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RecoverPage();
}

class _RecoverPage extends BaseStatePage<RecoverViewModel,
    RecoverViewModelInput, RecoverViewModelOutput, RecoverPage> {
  @override
  RecoverViewModelInput makeInput() {
    return RecoverViewModelInput();
  }

  @override
  RecoverViewModel makeViewModel() {
    return RecoverViewModel();
  }
}
