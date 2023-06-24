

import 'dart:math';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mvvm/main.dart';
void main() async {
  await dotenv.load(fileName: "prod.env");
  print("${dotenv.env}");
  App.shared.run();
}