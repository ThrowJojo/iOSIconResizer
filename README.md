# iOSIconResizer

This is just a simple command line application written in Dart to convert an icon image file into all of the different sizes that need to be targetted in iOS. 

# Installation
At the moment this is only on Github so this should do the trick for now:

```bash
git clone https://github.com/ThrowJojo/iOSIconResizer.git
cd iOSIconResizer
pub global activate --source path .
```

# Usage

After installation, in the same folder as the icon use this command to convert it:

```bash
resize_icon_ios --icon icon.png
```

After conversion there will be a number of different sizes created, you can see them all in the bin/config.yaml. The command will also generate(copy) a Contents.json file so you can copy and paste all of the icons and the Contents.json file into the asset folder for your icons and they'll all be ready to go. 

You can also use *--folder* as an option too if you want to create a new folder for all the converted image files:

```bash
resize_icon_ios --folder converted --icon icon.png
```
