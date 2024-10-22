import 'package:beautilly/screens/join_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:beautilly/main.dart'; // Ensure this matches your actual package name

void main() {
  testWidgets('App Launches Successfully', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify if the app displays the JoinPage or any key widget.
    expect(find.byType(JoinPage), findsOneWidget); // Adjust according to the actual initial widget
  });
}
