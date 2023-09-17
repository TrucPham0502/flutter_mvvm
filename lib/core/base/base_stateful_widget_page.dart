import 'package:flutter/material.dart';
import 'package:mvvm/core/injection/injection.dart';

import 'app_base_viewmodel.dart';

// ignore: must_be_immutable
abstract class BaseStatefulWidgetPage <VM extends AppBaseViewModel> extends StatefulWidget {
  final VM viewModel;
  const BaseStatefulWidgetPage({super.key, required this.viewModel });
}
