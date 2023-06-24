
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mvvm/main.dart';

void main() async {
  await dotenv.load(fileName: "dev.env");
  print("dev config ========== ${dotenv.env}");
  App.shared.run();
}