import 'package:flutter/material.dart';
import 'contact_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var inputController1 = TextEditingController();
  var inputController2 = TextEditingController();
  List<Map<String, String>> dataKontak = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Contacts'),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.mobile_friendly),
                const SizedBox(height: 15.0),
                const Text(
                  'CREATE NEW CONTACT',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15.0),
                const Text(
                  'A dialog is a type of modal window that appears in front of app content to provide critical information or prompt for a decision to be made.',
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 10.0),
                const Divider(),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.purple[50],
                    labelText: 'Name',
                    hintText: 'Insert your name',
                  ),
                  controller: inputController1,
                  onChanged: (inputController1) {
                    print('$inputController1');
                  },
                ),
                const SizedBox(height: 10.0),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.purple[50],
                    labelText: 'Nomor',
                    hintText: '+62...',
                  ),
                  controller: inputController2,
                  onChanged: (inputController2) {
                    print('$inputController2');
                  },
                ),
                const SizedBox(height: 10.0),
                Container(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (inputController1.text.isNotEmpty) {
                          dataKontak.add({
                            "nama": "${inputController1.text}",
                            "nomer": "${inputController2.text}"
                          });
                        }
                      });
                      print('dataKontak : $dataKontak');
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.purple[900]),
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'List Contacts',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 10.0),
                // Tambahkan widget ContactList
                ContactList(contacts: dataKontak),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
