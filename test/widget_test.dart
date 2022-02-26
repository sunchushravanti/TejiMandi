import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teji_mandi/constants.dart/constant_data.dart';

import 'package:teji_mandi/main.dart';

void main() {
  testWidgets('Testing the widget', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyHomePage());
    expect(find.text(ConstantsData().headline), findsOneWidget);

    await tester.pump();
    await tester.pump();
    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);

    await tester.pump();
    await tester.pump();
  });
}
