// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trufi_core/location/location_form_field.dart';
import 'package:trufi_core/trufi_app.dart';
import 'package:trufi_core/trufi_configuration.dart';
import 'package:trufi_core/trufi_localizations.dart';

import 'image_tile.dart';
import 'mock_http_client.dart';

void main() {
  setUp(() async {
    HttpOverrides.global = new TestHttpOverrides({
      Uri.parse('https://maps.tilehosting.com/styles/positron/5/17/tile.png'):
          dummyImageData
    });
  });

  testWidgets('Trufi App - Home Widget', (WidgetTester tester) async {
    final trufiCfg = TrufiConfiguration();
    trufiCfg.languages.addAll([
      TrufiConfigurationLanguage(
        languageCode: "en",
        countryCode: "US",
        displayName: "English",
      ),
    ]);

    await tester.pumpWidget(TrufiApp(
      theme: ThemeData(
        primaryColor: const Color(0xff263238),
        primaryColorLight: const Color(0xffeceff1),
        accentColor: const Color(0xffd81b60),
        backgroundColor: Colors.white,
      ),
      localization: const TrufiLocalizationDefault(),
    ));

    await tester.pumpAndSettle();
    final Finder formField = find.byType(LocationFormField);
    expect(formField, findsNWidgets(2));
  });
}

class HomeRobot {
  HomeRobot seesMyLocationFab() {
    expect(find.byIcon(Icons.my_location), findsOneWidget);
    return this;
  }

  HomeRobot seesAppBar() {
    final Finder formField = find.byType(AppBar);
    expect(formField, findsOneWidget);
    return this;
  }

  HomeRobot seesFormFields() {
    final Finder formField = find.byType(LocationFormField);
    expect(formField, findsNWidgets(2));
    return this;
  }
}
