import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Rubah App')),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Welcome to Section'),
                background: Image.network('https://th.bing.com/th/id/OIP.a_Y-cHzWGMIwIMeLYMj6CwHaLH?w=186&h=279&c=7&r=0&o=5&pid=1.7'),
                fit:Box,
              ),
            )
          ],
        ),
      ),
    );
  }
}