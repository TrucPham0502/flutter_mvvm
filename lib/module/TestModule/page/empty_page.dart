
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm/module/TestModule/viewmodel/empty_viewmodel.dart';

import '../../../core/base/base_page.dart';
import '../../../core/base/base_stateful_widget_page.dart';

class EmptyPage extends BaseStatefulWidgetPage<EmptyPageViewModel> {
  const EmptyPage({super.key, required super.viewModel});
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _EmptyPage(viewModel: viewModel);
}

class _EmptyPage extends BasePage<EmptyPageViewModel> {
  _EmptyPage({required super.viewModel});
}
