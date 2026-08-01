import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:stardy_app/main.dart';

void main() {
  testWidgets('App builds without throwing', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
