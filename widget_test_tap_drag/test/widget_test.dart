// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:widget_test_tap_drag/main.dart';

void main() {
  testWidgets('Add and remove a todo', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(new TodoList());

    await tester.enterText(find.byType(TextField), 'hi');

    await tester.tap(find.byType(FloatingActionButton));

    await tester.pump();

    expect(find.text('hi'), findsOneWidget);

    await tester.drag(find.byType(Dismissible), Offset(500.0, 0.0));

    await tester.pumpAndSettle();

    expect(find.text('h1'), findsNothing);
  });
}
