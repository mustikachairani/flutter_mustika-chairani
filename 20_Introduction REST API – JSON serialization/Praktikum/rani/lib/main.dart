import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Contact {
  final int id;
  final String name;
  final String phone;

  Contact({required this.id, required this.name, required this.phone});

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'] as int,
      name: json['name'] as String,
      phone: json['phone'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
    };
  }
}

void main() {
  fetchData();
  deserialisasi();
  updateData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final dio = Dio();
  Map<String, dynamic> dataFetching = {};
  List<Contact> contactList = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    fetchData();
  }

  Future fetchData() async {
    final response = await dio.get('https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts');
    print(response.data);

    final List<Contact> contacts = (response.data as List<dynamic>).map((json) => Contact.fromJson(json)).toList();

    setState(() {
      dataFetching['contacts'] = contacts;
      contactList = contacts; // Update contactList after fetching data
    });
  }

  Future updateData() async {
    if (contactList.isNotEmpty) {
      final updatedContact = Contact(id: 1, name: 'foo', phone: 'bar');
      final Map<String, dynamic> requestBody = updatedContact.toJson();

      try {
        final response = await dio.put('https://jsonplaceholder.typicode.com/posts/1', data: requestBody);
        print(response.data);
        // Do something with the response if needed
      } catch (error) {
        print('Error updating data: $error');
      }
    }
  }

  @override
  void initState() {
    fetchData();
    print("initial");
    super.initState();
  }

  Widget _buildContactList() {
    if (contactList.isNotEmpty) {
      return ListView.builder(
        itemCount: contactList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(contactList[index].name),
            subtitle: Text(contactList[index].phone),
          );
        },
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _buildContactList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementCounter();
          updateData();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

//Post
Future<void> fetchData() async {
  final dio = Dio();

  try {
    final response = await dio.post(
      'http://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
      data: {
        "name": "Delia Sepiana",
        "phone": "09876543214",
      },
    );

    if (response.statusCode == 201) {
      print('Berhasil melakukan permintaan POST');
      print('Data respons: ${response.data}');
    } else {
      print('Gagal melakukan POST');
      print('Kode status: ${response.statusCode}');
    }
  } catch (e) {
    print('Terjadi kesalahan: $e');
  }
}

//Deserialisasi
Future<void> deserialisasi() async {
  final dio = Dio();

  try {
    final response = await dio.get(
        'http://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts');

    if (response.statusCode == 200) {
      List<dynamic> jsonContacts = response.data;

      List<Contact> contacts = jsonContacts.map((jsonContact) {
        return Contact.fromJson(jsonContact);
      }).toList();

      for (var contact in contacts) {
        print('ID: ${contact.id}');
        print('Nama: ${contact.name}');
        print('Nomor: ${contact.phone}');
      }
    } else {
      print('Gagal melakukan permintaan GET');
      print('Kode status: ${response.statusCode}');
    }
  } catch (e) {
    print('Terjadi kesalahan: $e');
  }
}

//Put
Future<void> updateData() async {
  final dio = Dio();
  try {
    final response = await dio.put(
      'https://jsonplaceholder.typicode.com/posts/1',
      data: {
        "title": "foo",
        "body": "bar",
        "userId": 1,
      },
    );

    if (response.statusCode == 200) {
      print('Berhasil melakukan permintaan PUT');
      print('Data respons: ${response.data}');
    } else {
      print('Gagal melakukan permintaan PUT');
      print('Kode status: ${response.statusCode}');
    }
  } catch (e) {
    print('Terjadi kesalahan: $e');
  }
}
