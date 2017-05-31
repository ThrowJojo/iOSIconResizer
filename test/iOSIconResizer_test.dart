// Copyright (c) 2017, jordanholland. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:iOSIconResizer/iOSIconResizer.dart';
import 'package:image/image.dart';
import 'package:test/test.dart';
import '../bin/Helpers.dart';
import 'dart:io';

void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });

  test('loadImage', () {
    Image image = Helpers.loadImage("icon.png");
    expect(image == null, false);
    Image image2 = Helpers.loadImage("icon2.png");
    expect(image2, null);
  });

  test('loadIconSizes', () {
    List<IconSize> iconSizes = Helpers.loadIconSizes("../bin/config.yaml");
    expect(iconSizes.length > 0, true);
  });

  test('resizeImageAndSave', () {
    Image image = Helpers.loadImage("icon.png");
    expect(image == null, false);
    List<IconSize> iconSizes = Helpers.loadIconSizes("../bin/config.yaml");
    expect(iconSizes.length > 0, true);
    Helpers.resizeImageAndSave(image, iconSizes[0]);
    Image resizedImage = Helpers.loadImage("${iconSizes[0].name}.png");
    expect(resizedImage == null, false);
  });

  test('exists', () async {
    bool exists = await new File("file_that_doesnt_exist.png").exists();
    expect(exists, false);
  });

  test('copyFile', () async {
    Helpers.copyFile("icon.png", "copied_icon.png");
    bool exists = await new File("copied_icon.png").exists();
    expect(exists, true);
  });

  test('getPath', () {
    String path = Helpers.getPath();
    expect(path.contains("/test"), true);
  });

  test('createDirectory', () async {
      Helpers.createDirectory("blah");
      bool exists = await new Directory("blah").exists();
      expect(exists, true);
      new Directory("blah").delete(recursive: true);
  });

}
