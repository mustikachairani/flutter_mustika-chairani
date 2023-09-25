
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var inputControllers1 = TextEditingController();
  var inputControllers2 = TextEditingController();
  List<Map<String, String>> dataKontak = [];
  String _selectedFieldPath = '';
  Color _selectedColor = Colors.amber;
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                'A dialog is a type of modal window that appears in front of app content to provide critical information or prompt for a decision to be made.',
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
                  print('$inputController1');
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Date'),
                  TextButton(onPressed: _pickDate, child: Text('Select')),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(DateFormat('dd-MM-yyyy').format(_dueDate)),
              SizedBox(
                height: 20.0,
              ),
              Text('Color'),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 100,
                width: double.infinity,
                color: _selectedColor,
              ),
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                  ),
                  onPressed: _pickColor,
                  child: Text('Pick Color'),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text('Pick Files'),
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: _pickFile,
                  child: Text('Pick and Open File'),
                ),
              ),
              if (_selectedFieldPath.isNotEmpty)
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Seleted File Path: $_selectedFieldPath'),
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
                        "nomer": "${inputControllers2.text}",
                        "date" : "${_dueDate.toLocal().toString()}",
                        "color": "${_selectedColor.toString()}",
                        "file": "${_selectedFieldPath}"
    
                      });
                      inputControllers1.clear();
                      inputControllers2.clear();
                    });
                    print('dataKontak : $dataKontak');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple[900],
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'List Contacts',
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
                            icon: Icon(Icons.delete),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickDate() async {
    var showDatePicker2 = showDatePicker(
      context: context,
      initialDate: _dueDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
    );
    final DateTime? pickedDate = await showDatePicker2;
    if (pickedDate != null && pickedDate != _dueDate) {
      setState(() {
        _dueDate = pickedDate;
      });
    }
  }

  void _pickColor() {
    showDialog(
      context: context,
      builder: (BuildContext contex) {
        return AlertDialog(
          title: Text('Pick a Color'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: _selectedColor,
              onColorChanged: (color) {
                setState(() {
                  _selectedColor = color;
                });
              },
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _selectedFieldPath = result.files.single.path!;
      });
    }
  }
}
