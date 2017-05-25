import 'dart:io';
import 'package:yaml/yaml.dart';
import 'package:image/image.dart';
import 'package:path/path.dart' show dirname;

class IconSize {
  String name;
  int dimension;
  IconSize(this.name, this.dimension);
}

class Helpers {

  // Loads icon sizes from config.yaml file
  static List<IconSize> loadIconSizes(String configPath) {
    String configData = new File(configPath).readAsStringSync();
    var document = loadYaml(configData);
    var specs = document['sizes'];
    List<IconSize> iconSizes = [];
    for (var spec in specs) {
      IconSize iconSize = new IconSize(spec['name'], spec['dimension']);
      iconSizes.add(iconSize);
    }
    return iconSizes;
  }

  // Loads an image from the @{filePath}, returns nil if there is an issue
  static Image loadImage(String filePath) {
    try {
      return decodeImage(new File(filePath).readAsBytesSync());
    } catch (e) {
      return null;
    }
  }

  // Resizes @{imaged} based on list of @{iconSizes}
  static resizeImageToSizes(Image image, List<IconSize> iconSizes) {
    for (IconSize iconSize in iconSizes) {
      resizeImageAndSave(image, iconSize);
    }
  }

  // Resizes the provided @{image} and then saves it
  static resizeImageAndSave(Image image, IconSize iconSize) {
    Image resizedImage = copyResize(image, iconSize.dimension);
    new File("${iconSize.name}.png")..writeAsBytesSync(encodePng(resizedImage));
  }

  // Copies a file to @{newFilePath}
  static copyFile(String filePath, String newFilePath) {
    try {
     File file = new File(filePath);
     file.copySync(newFilePath);
    } catch (e) {
      print(e);
    }
  }

  // Gets path for current script
  static String getPath() {
    return dirname(Platform.script.path.toString());
  }

}