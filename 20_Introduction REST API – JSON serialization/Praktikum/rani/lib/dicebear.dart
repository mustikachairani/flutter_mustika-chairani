import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Uint8List? imageData;

  @override
  void initState() {
    super.initState();
    fetchDiceBearImage();
  }

  Future<void> fetchDiceBearImage() async {
    try {
      final response = await Dio().get(
        'https://api.dicebear.com/7.x/bottts/png',
        options: Options(responseType: ResponseType.bytes),
      );

      if (response.statusCode == 200) {
        setState(() {
          imageData = Uint8List.fromList(response.data);
        });
      } else {
        throw Exception('Failed to load image');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('DiceBear Image')),
        ),
        body: Center(
          child: imageData == null
              ? CircularProgressIndicator()
              : Image.memory(imageData!),
        ),
      ),
    );
  }
}
