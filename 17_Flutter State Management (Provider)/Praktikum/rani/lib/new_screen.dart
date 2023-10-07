import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {
  final int selectedIndex;
  final List<String> images;
  NewScreen({required this.selectedIndex, required this.images});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Gambar'),
      ),
      body: Center(
        child: Image.asset(
          images[selectedIndex],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
