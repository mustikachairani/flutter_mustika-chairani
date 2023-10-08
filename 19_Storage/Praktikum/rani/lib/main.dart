import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Map<String, String>> dataKontak = [
  {"nama": "Name 1", "nomer": "0897654321"},
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var inputControllers1 = TextEditingController();
  var inputControllers2 = TextEditingController();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  String username = "";

  @override
  void initState() {
    super.initState();
    loadUsername();
  }

  Future<void> loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? "";
    });
  }

  Future<void> saveUsername(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('username');
    setState(() {
      username = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contacts'),
          actions: [
            if (username.isNotEmpty)
              IconButton(
                onPressed: () {
                  logout();
                },
                icon: Icon(Icons.exit_to_app),
              ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(15.0),
            child: username.isEmpty ? buildLoginUI() : buildContactsUI(),
          ),
        ),
      ),
    );
  }

  Widget buildLoginUI() {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.purple[50],
            labelText: 'Username',
            hintText: 'Enter your username',
          ),
          controller: usernameController,
        ),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.purple[50],
            labelText: 'Password',
            hintText: 'Enter your password',
          ),
          controller: passwordController,
        ),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            if (usernameController.text.isNotEmpty &&
                passwordController.text.isNotEmpty) {
              saveUsername(usernameController.text);
              loadUsername();
            }
          },
          style: ElevatedButton.styleFrom(primary: Colors.purple[900]),
          child: Text(
            'Login',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget buildContactsUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.mobile_friendly),
        SizedBox(height: 15.0),
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
          controller: inputControllers1,
          onChanged: (inputController1) {
            print('$inputControllers1');
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
          controller: inputControllers2,
          onChanged: (inputControllers2) {
            print('$inputControllers2');
          },
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.bottomRight,
          child: ElevatedButton(
              onPressed: () {
                setState(() {
                  dataKontak.add({
                    "nama": "${inputControllers1.text}",
                    "nomer": "${inputControllers2.text}"
                  });
                });
                print('dataKontak : $dataKontak');
              },
              style: ElevatedButton.styleFrom(primary: Colors.purple[900]),
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              )),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          'List Contacts - $username',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(
          height: 10.0,
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
            itemCount: dataKontak.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.purple[50],
                  child: Text(
                    'A',
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
                title: Text('${dataKontak[index]["nama"]}'),
                subtitle: Text('${dataKontak[index]["nomer"]}'),
                trailing: Wrap(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            dataKontak.removeAt(index);
                          });
                        },
                        icon: Icon(Icons.delete)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
