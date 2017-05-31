// Copyright (c) 2017, jordanholland. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:iOSIconResizer/iOSIconResizer.dart' as iOSIconResizer;
import 'Helpers.dart';
import 'package:image/image.dart';
import 'package:args/args.dart';

main(List<String> arguments) {

  var parser = new ArgParser();
  parser.addOption('folder');
  parser.addOption('icon');
  var results = parser.parse(arguments);
  String icon = results['icon'];

  if (icon != null) {
    Image loadedImage = Helpers.loadImage(icon);
    if (loadedImage != null) {
      String path = Helpers.getPath();
      List<IconSize> iconSizes = Helpers.loadIconSizes("${path}/config.yaml");
      Helpers.resizeImageToSizes(loadedImage, iconSizes);
      Helpers.copyFile("${path}/Contents.json", "Contents.json");
    } else {
      print("There was an issue loading the specified icon file, make sure it exists.");
    }
  } else {
    print("No icon specified.");
  }

}
