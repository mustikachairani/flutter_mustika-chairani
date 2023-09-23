import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Contacts'),
          ),
          body: Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.mobile_friendly),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'CREATE NEW CONTACT',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'A dialog is a type of modal window that appears in front of app content to provide critical information. or prompt for a decision to be made.',
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Divider(),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.purple[50],
                    labelText: 'Name',
                    hintText: 'Insert your name',
                  ),
                  onChanged: (text) {
                    print('$text');
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.purple[50],
                    labelText: 'Nomor',
                    hintText: '+62...',
                  ),
                  onChanged: (text) {
                    print('$text');
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                      onPressed: () {
                        
                      },
                      style:
                          ElevatedButton.styleFrom(primary: Colors.purple[900]),
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            ),
          )),
    );
  }
}
