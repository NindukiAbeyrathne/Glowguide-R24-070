import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:beautilly/screens/home_page.dart';

void main() {
  testWidgets('HomePage displays greeting and action text', (WidgetTester tester) async {
    // Build the HomePage widget.
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    // Verify that the "Hello, Samantha" text is displayed.
    expect(find.text('Hello, Samantha'), findsOneWidget);

    // Verify that the "What do you want to do?" text is displayed.
    expect(find.text('What do you want to do?'), findsOneWidget);
    
    // Verify that the recommended beauticians section is displayed
    expect(find.text('Recommended Beauticians for You'), findsOneWidget);
    
    // Check for the loading indicator when recommended beauticians are empty
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
