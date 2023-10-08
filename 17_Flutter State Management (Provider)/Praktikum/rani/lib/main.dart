import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rani/galeri.dart';
import 'contact_model.dart'; // Sesuaikan path dengan struktur proyek Anda
 // Sesuaikan path dengan struktur proyek Anda

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ContactModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Galeri(),
    );
  }
}
