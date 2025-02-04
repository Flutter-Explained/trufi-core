import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';

import 'package:trufi_core/trufi_app.dart';

void main() {
  enableFlutterDriverExtension();
  runApp(TrufiApp(
    theme: ThemeData(
      primaryColor: const Color(0xff263238),
      primaryColorLight: const Color(0xffeceff1),
      accentColor: const Color(0xffd81b60),
      backgroundColor: Colors.white,
    ),
  ));
}
