
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const HelloWorld());
}

class HelloWorld extends StatelessWidget {
  const HelloWorld({super.key});

  // This widget is the root of your application.
  @override
 Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Cupertino Aku'), // Judul di navigation bar
        ),
        child: Center(
          child: Text('Cupertino Aku'), // Teks di tengah halaman
        ),
      ),
    );
  }
}
