// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('finds a Text Widget', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Text('H'),
      ),
    ));

    expect(find.text('H'), findsOneWidget);
  });

  testWidgets('finds a Widget using a Key', (WidgetTester tester) async {
    final testKey = Key('K');

    await tester.pumpWidget(MaterialApp(key: testKey, home: Container()));

    expect(find.byKey(testKey), findsOneWidget);
  });
}