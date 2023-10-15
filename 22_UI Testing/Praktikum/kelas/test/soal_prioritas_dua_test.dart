import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kelas/soal_prioritas_dua.dart';

void main() {
  group("halaman contact", () {
    testWidgets("Widget Rendering Test", (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: soalPrioritasDua()));
    });
    expect(find.text("Create New Contacts"), findsOneWidget);
    expect(
        find.text(
            "A dialog is a type of modal windows that appears in front of app content to provide citical information or prompt for decision to be made"),
        findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));
  });
}