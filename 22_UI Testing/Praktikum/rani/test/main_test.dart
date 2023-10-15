import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rani/main.dart';

void main() {
  testWidgets('MyApp UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Contacts'), findsOneWidget);
    expect(find.text('CREATE NEW CONTACT'), findsOneWidget);
    expect(find.text('List Contacts'), findsOneWidget);

    // Tidak ada kontak di awal
    expect(find.text('Name 1'), findsNothing);

    // Simulasikan pengisian nilai pada TextField
    await tester.enterText(find.widgetWithText(TextField, 'Name'), 'John Doe');
    await tester.enterText(find.widgetWithText(TextField, 'Nomor'), '123456789');

    // Tap tombol "Submit" dan trigger frame
    await tester.tap(find.text('Submit'));
    await tester.pump();

    // Verifikasi bahwa kontak baru ditambahkan ke daftar
    expect(find.text('John Doe'), findsOneWidget);
  });
}
