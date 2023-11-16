import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'drawer.dart';
import 'new_screen.dart';
import 'contact_model.dart'; // Import ContactModel

void main() {
  runApp(Galeri());
}

class Galeri extends StatefulWidget {
  Galeri({super.key});

  @override
  State<Galeri> createState() => _GaleriState();
}

class _GaleriState extends State<Galeri> {
  final List<String> images = [
    'crab.jpeg',
    'ibu.jpeg',
    'ikan.jpg',
    'mermeid.jpeg',
    'patrik.jpeg',
    'spon.jpeg',
    'squid.jpeg',
    // Tambahkan path gambar sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Galeri'),
      ),
      body: Consumer<ContactModel>( // Gunakan Consumer untuk mendapatkan akses ke ContactModel
        builder: (context, contactModel, child) {
          return GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            padding: EdgeInsets.all(2),
            children: List.generate(images.length, (index) {
              return InkWell(
                onTap: () {
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                    ),
                    context: context,
                    builder: (context) => SingleChildScrollView(
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              images[index],
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text('Apakah anda ingin melihat lebih detail?'),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NewScreen(
                                          selectedIndex: index,
                                          images: images,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text('yes'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('No'),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // Menampilkan data kontak dari ContactModel
                            Text('Data Kontak: ${contactModel.dataKontak}'),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: Image.asset(
                  images[index],
                  fit: BoxFit.cover,
                ),
              );
            }),
          );
        },
      ),
      drawer: MyDrawer(),
    );
  }
}
