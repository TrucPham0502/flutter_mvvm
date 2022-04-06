import 'dart:io';
import 'package:path/path.dart' as path;
import "package:yaml/yaml.dart";

void main() {
  createFile();
}

void createFile() {
  var file = File(path.join(Directory.current.path, 'pubspec.yaml'));
  file.readAsString().then((String contents) {
    final mapData = loadYaml(contents);
    var images = mapData['flutter']['assets'] as List<dynamic>;
    var classFile =
        File(path.join(Directory.current.path, 'lib/app_gen_assets.dart'));
    var content = 'class AppGenAssets {\n';
    for (var image in images) {
      final fileName = image.toString().split('/').last;
      final name = fileName.split('.').first;
      final ext = fileName.split('.').last;
      content + "\t static String $name${ext.toUpperCase()} = '$image';\n";
    }
    content + "}";
    var output = classFile.openWrite();
    output.write(content);
    output.close();
  });
}
