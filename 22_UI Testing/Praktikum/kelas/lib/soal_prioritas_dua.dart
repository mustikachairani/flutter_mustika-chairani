import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
// import 'package:open';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

class soalPrioritasDua extends StatefulWidget {
  const soalPrioritasDua({super.key});

  @override
  State<soalPrioritasDua> createState() => _soalPrioritasDuaState();
}

// class _soalPrioritasDuaState extends State<soalPrioritasDua> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

class _soalPrioritasDuaState extends State<soalPrioritasDua> {
  // const name({Key key}) : super(key: key);
  String _inputText = ''; // State untuk menyimpan input dari form
  String _inputText2 = ''; // State untuk menyimpan input dari form
  var namaEdit = '';
  var subtitleEdit = '';
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  var _selectedDate = DateTime.now();
  Color _currentColor = Color.fromARGB(131, 255, 0, 200);
  var _currentPathFile = '';
  List listContacts = [
    {
      'title': "masbi",
      'subtitle': "pinter",
      'date': '2023-09-16 00:00:00.000',
      'color': Colors.black,
      'path': 'path 1',
    },
    {
      'title': "Contacts2",
      'subtitle': "subContacts2",
      'date': '2023-10-16 00:00:00.000',
      'color': Colors.blue,
      'path': 'path 2',
    },
    {
      'title': "Contacts3",
      'subtitle': "subContacts3",
      'date': '2023-11-16 00:00:00.000',
      'color': Colors.green,
      'path': 'path 3',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Task Form soal nomor 1',
      home: Scaffold(
        appBar: AppBar(title: const Text('Contacts')),
        body: ListView(
          padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
          children: [
            const Icon(Icons.phone),
            const Text(
              'Create New Contacts',
              style: TextStyle(fontFamily: 'italic'),
            ),
            const Text(
              'A dialog is a type of modal windows that appears in front of app content to provide citical information or prompt for decision to be made',
              style: TextStyle(fontFamily: 'italic'),
            ),
            const Divider(),
            FormNama(),
            Container(
              child: const Padding(padding: EdgeInsets.only(top: 8)),
            ),
            FormNomor(),
            BuildDatePicker(context),
            const SizedBox(
              height: 20,
            ),
            BuildColorPicker(context),
            buildFilePicker(),
            ButtonSubmit(),
            const Text(
              'List Contacts',
              style: TextStyle(fontSize: 24),
            ),
            ListContacts(),
          ],
        ),
      ),
    );
  }

  Widget buildFilePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text('Pick File'),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              _pickFile();
            },
            child: const Text('Pick and Open File'),
          ),
        ),
      ],
    );
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    // final file = result.files.first;
    _currentPathFile = '${result.files.single.name}';
    print(result.files.single.name);
    // print('file path =  $file[path]');
    // _openFile(file);
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  Widget BuildColorPicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Color'),
        const SizedBox(height: 10),
        Container(
          height: 100,
          width: double.infinity,
          color: _currentColor,
        ),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(_currentColor)),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (contect) {
                    return AlertDialog(
                      title: const Text('Pick  Your  Color'),
                      content: BlockPicker(
                          pickerColor: _currentColor,
                          onColorChanged: (color) {
                            setState(() {
                              _currentColor = color;
                              print('Color : $color');
                            });
                          }),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Save'))
                      ],
                    );
                  });
            },
            child: const Text('Pick Color'),
          ),
        ),
      ],
    );
  }

  Column BuildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Date'),
            TextButton(
                onPressed: () async {
                  final selectDate = await showDatePicker(
                      context: context,
                      initialDate: currentDate,
                      firstDate: DateTime(1990),
                      lastDate: DateTime(currentDate.year + 5));
                  setState(() {
                    if (selectDate != null) {
                      _dueDate = selectDate;
                      _selectedDate = selectDate;
                    }
                  });
                  print('$selectDate');
                },
                child: const Text('Select'))
          ],
        ),
        Text(
          DateFormat('dd-MM-yyyy').format(_dueDate),
        )
      ],
    );
  }

  ListView ListContacts() {
    return ListView.builder(
      itemCount: listContacts.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ListTile(
          // tileColor: Colors.amber,
          // title: Text('$_inputText'),
          title: Text(listContacts[index]['title']),
          leading: Container(
            child: const Center(
              child: Text(
                "L",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                // '$listContacts[index]',
                listContacts[index]['subtitle'],
                softWrap: true,
                maxLines: 3, // Maksimal tiga baris teks
                overflow: TextOverflow
                    .ellipsis, // Tampilkan tanda elipsis jika terpotong
              ),
              Text(
                // '$listContacts[index]',
                'date = ' + listContacts[index]['date'],
                softWrap: true,
                maxLines: 3, // Maksimal tiga baris teks
                overflow: TextOverflow
                    .ellipsis, // Tampilkan tanda elipsis jika terpotong
              ),
              Row(
                children: [
                  Text(
                    // '$listContacts[index]',
                    'Color =  ',
                    softWrap: true,
                    maxLines: 3, // Maksimal tiga baris teks
                    overflow: TextOverflow
                        .ellipsis, // Tampilkan tanda elipsis jika terpotong
                  ),
                  Container(
                    color: listContacts[index]['color'],
                    height: 15,
                    width: 15,
                  )
                ],
              ),
              Text(
                // '$listContacts[index]',
                'File Name = ' + listContacts[index]['path'],
                softWrap: true,
                maxLines: 3, // Maksimal tiga baris teks
                overflow: TextOverflow
                    .ellipsis, // Tampilkan tanda elipsis jika terpotong
              ),
            ],
          ),

          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) {
                    // Set default values here
                    namaEdit = listContacts[index]['title'];
                    subtitleEdit = listContacts[index]['subtitle'];
                    return AlertDialog(
                      title: const Text('Edit Data'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 50,
                            child: TextField(
                              controller: TextEditingController(
                                  text: listContacts[index]['title']),
                              onChanged: (value) {
                                namaEdit = listContacts[index]['title'] = value;
                                print(value);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: TextField(
                              controller: TextEditingController(
                                  text: listContacts[index]['subtitle']),
                              onChanged: (value) {
                                subtitleEdit =
                                    listContacts[index]['subtitle'] = value;
                                print(value);
                              },
                            ),
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              listContacts[index]['title'] = namaEdit;
                              listContacts[index]['subtitle'] = subtitleEdit;
                            });
                            print('$namaEdit');
                            Navigator.pop(context, 'OK');
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                ),
                splashRadius: 20,
              ),
              IconButton(
                  icon: const Icon(Icons.delete),
                  splashRadius: 20,
                  onPressed: () {
                    //logic to delete
                    setState(() {
                      listContacts.removeAt(index);
                      print(listContacts);
                    });
                  }),
            ],
          ),
        );
      },
    );
  }

  Container ButtonSubmit() {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      alignment: Alignment.bottomRight,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.all(Radius.circular(20)),
      //   color: Color(0xFF6200EE),
      // ),
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return const Color(0xFF6200EE);
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        // onChanged: (value) {
        //     setState(() {
        //       _inputText2 = value; // Update state ketika input berubah
        //     });
        //     print(_inputText2);
        //   },
        onPressed: () {
          setState(() {
            listContacts.add({
              'title': '$_inputText',
              'subtitle': '$_inputText2',
              'date': '$_selectedDate',
              'color': _currentColor,
              'path': _currentPathFile,
            });
            print('color in the submit $_currentColor');
          });
          print(listContacts);
        },
        child: Text('submit'),
      ),
    );
  }

  Container FormNomor() {
    return Container(
      color: const Color.fromARGB(255, 211, 193, 236),
      child: Padding(
        padding: EdgeInsets.only(top: 0, bottom: 0),
        child: TextField(
          onChanged: (value) {
            setState(() {
              _inputText2 = value; // Update state ketika input berubah
            });
            print(_inputText2);
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Nomor +62',
          ),
        ),
      ),
    );
  }

  Container FormNama() {
    return Container(
      color: const Color.fromARGB(255, 211, 193, 236),
      child: TextField(
        onChanged: (value) {
          setState(() {
            _inputText =
                value; // Update state ketika input berubah // Update state ketika input berubah
          });
          print(_inputText);
        },
        // controller: TextEditingController(text: 'hai'),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Name',
          // Change the background color here
        ),
      ),
    );
  }
}

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Submit'),
    );
  }
}