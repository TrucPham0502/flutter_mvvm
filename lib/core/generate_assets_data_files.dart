import 'dart:io';
import 'package:path/path.dart' as path;
import "package:yaml/yaml.dart";

void run() {
  createFile();
}

void createFile() {
  var file =
      File(path.join("/Users/trucpham/Desktop/flutter_mvvm", 'pubspec.yaml'));
  file.readAsString().then((String contents) {
    final mapData = loadYaml(contents);
    var images = mapData['flutter']['assets'] as List<dynamic>;
    var classFile =
        File('/Users/trucpham/Desktop/flutter_mvvm/lib/app_gen_assets.dart');
    var output = classFile.openWrite();
    output.write('class AppGenAssets {\n');
    for (var image in images) {
      final fileName = image.toString().split('/').last;
      final name = fileName.split('.').first;
      final ext = fileName.split('.').last;
      output.write("\t static String $name${ext.toUpperCase()} = '$image';\n");
    }
    output.write("}");
    output.close();
  });
}
