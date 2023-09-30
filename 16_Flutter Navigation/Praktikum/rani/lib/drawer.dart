import 'package:flutter/material.dart';

import 'kontak.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            title: Text('Contact'),
            onTap: () {
              // Tambahkan logika ketika menu 1 dipilih
              Navigator.pop(context); // Tutup drawer sebelum navigasi
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ContactPage(), // Ganti dengan halaman kontak yang sesuai
                  ));
            },
          ),
          ListTile(
            title: Text('Galeri'),
            onTap: () {
              // Tambahkan logika ketika menu 2 dipilih
              Navigator.pop(context);
            },
          ),
          // Tambahkan menu lain sesuai kebutuhan
        ],
      ),
    );
  }
}
