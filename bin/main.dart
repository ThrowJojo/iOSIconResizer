// Copyright (c) 2017, jordanholland. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:iOSIconResizer/iOSIconResizer.dart' as iOSIconResizer;
import 'Helpers.dart';
import 'package:image/image.dart';


main(List<String> arguments) {
  if (arguments.length > 0) {
    Image loadedImage = Helpers.loadImage(arguments[0]);
    if (loadedImage != null) {
      String path = Helpers.getPath();
      List<IconSize> iconSizes = Helpers.loadIconSizes("${path}/config.yaml");
      Helpers.resizeImageToSizes(loadedImage, iconSizes);
      Helpers.copyFile("${path}/Contents.json", "Contents.json");
    } else {
      print("There was an issue loading the specified image file, make sure it exists.");
    }
  } else {
    print("No image specified.");
  }
}
