import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:beautilly/screens/Admin/add_preference.dart';
import 'package:beautilly/screens/Admin/target_audience.dart';
import 'package:beautilly/screens/Page_with_bottom_navigation.dart';

void main() {
  testWidgets('PageWithBottomNavigation should show AddPreference by default', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: PageWithBottomNavigation()));

    // Verify that the AddPreference widget is shown by default.
    expect(find.byType(AddPreference), findsOneWidget);
    expect(find.byType(TargetAudience), findsNothing);
  });

  testWidgets('Tapping on BottomNavigationBar changes the displayed page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: PageWithBottomNavigation()));

    // Tap on the second item (TargetAudience).
    await tester.tap(find.byIcon(Icons.explore));
    await tester.pumpAndSettle(); // Wait for the animation to finish.

    // Verify that the TargetAudience widget is shown.
    expect(find.byType(TargetAudience), findsOneWidget);
    expect(find.byType(AddPreference), findsNothing);
  });

  testWidgets('Tapping on BottomNavigationBar switches back to AddPreference', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: PageWithBottomNavigation()));

    // Tap on the second item (TargetAudience) first.
    await tester.tap(find.byIcon(Icons.explore));
    await tester.pumpAndSettle(); // Wait for the animation to finish.

    // Now tap on the first item (AddPreference) again.
    await tester.tap(find.byIcon(Icons.home_filled));
    await tester.pumpAndSettle(); // Wait for the animation to finish.

    // Verify that the AddPreference widget is shown again.
    expect(find.byType(AddPreference), findsOneWidget);
    expect(find.byType(TargetAudience), findsNothing);
  });
}
