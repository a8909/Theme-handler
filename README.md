<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

THEME_MODE_MANAGER: It is a simple package that initializes your application theme in real time, it is a dynamic package that works for application of customized theme.
## Features

THEME_MODE_MANAGER: Manages the application theme in real time, simulation is optimized for easy use.

## Getting started

THEME_MODE_MANAGER: First you have to initlialize your app onInit using this method themeModeInit()
update the theme using setThemeMode().

## Usage

THEME_MODE_MANAGER: Do not change the _key, both ios and andriod can use.
import the package to the main.dart file of your application or whereever you want to use the package.

<!-- dart -->
eg. import 'package:theme_mode_manager/theme_mode_manager.dart';

onInit make sure you call the themeModeInit() as follows:

final ThemeModeHandler _themeHandler = ThemeModeHandler();

  @override
  void initState() {
    super.initState();
    <!-- call the thememodeinit to initialize the theme -->
    _themeHandler.themeModeInit();
  }

  To set the application themeMode ( light / dark ), use thus function:
  _themeHandler.setThemeMode(ThemeMode.dark);

  finally you can set a themeColor of your choice in the main.dart material widget and use the color of your choice.



## Additional information

TODO: To add features to the package just clone it and update the package with your code, please after adding your feature always update the test flle to run a proper test before pushing the package, update your commt with the feature you added. The package is expected to handle the flutter application theme manage with state-management .
