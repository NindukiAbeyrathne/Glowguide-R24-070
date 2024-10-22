import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:beautilly/widget/share_widget/face_treat_image_upload.dart'; // Adjust the import according to your file structure
import 'package:beautilly/widget/share_widget/face_page.dart'; // Import the facePage widget if it's defined in a separate file

void main() {
  testWidgets('FaceTreatImageUpload displays processing text and face page', (WidgetTester tester) async {
    // Build the FaceTreatImageUpload widget.
    await tester.pumpWidget(const MaterialApp(home: FaceTreatImageUpload()));

    // Verify that the "Processing..." text is displayed.
    expect(find.text('Processing...'), findsOneWidget);

    // Verify that the facePage widget is rendered
    expect(find.byType(FacePage), findsOneWidget); // Check if the facePage widget is in the widget tree

    // Verify that the image assets are loaded
    expect(find.byType(Image), findsNWidgets(2)); // Adjust the count according to the number of images used
  });
}
