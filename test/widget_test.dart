import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:test_upwork_bloc/main.dart';

void main() {
  testWidgets('Bloc widget starts loading', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our initial page starts with the loader
    expect(find.byWidget(CircularProgressIndicator()), findsOneWidget);
  });
}
