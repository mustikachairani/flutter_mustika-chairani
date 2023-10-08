import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  var inputController1 = TextEditingController();
  var inputController2 = TextEditingController();
  List<Map<String, String>> dataContacts = [];
  String _selectedFieldPath = '';
  Color _selectedColor = Colors.amber;
  DateTime _dueDate = DateTime.now();
  bool isEditing = false;
  int editingIndex = -1;

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
                controller: inputController1,
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
                  labelText: 'Number',
                  hintText: '+62...',
                ),
                controller: inputController2,
                onChanged: (inputController2) {
                  print('$inputController2');
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
                  child: Text('Selected File Path: $_selectedFieldPath'),
                ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (isEditing) {
                        // Save changes if editing
                        _saveEditing();
                      } else {
                        // Add new contact otherwise
                        _addContact();
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple[900],
                  ),
                  child: Text(
                    isEditing ? 'Save Changes' : 'Submit',
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
                  itemCount: dataContacts.length,
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
                      title: Text('${dataContacts[index]["name"]}'),
                      subtitle: Text('${dataContacts[index]["number"]}'),
                      trailing: Wrap(
                        children: [
                          IconButton(
                            onPressed: () {
                              _showDeleteConfirmationDialog(index);
                            },
                            icon: Icon(Icons.delete),
                          ),
                          IconButton(
                            onPressed: () {
                              _startEditing(index);
                            },
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
      builder: (BuildContext context) {
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

  void _addContact() {
    setState(() {
      dataContacts.add({
        "name": "${inputController1.text}",
        "number": "${inputController2.text}",
        "date": "${_dueDate.toLocal().toString()}",
        "color": "${_selectedColor.toString()}",
        "file": "${_selectedFieldPath}"
      });
      inputController1.clear();
      inputController2.clear();
    });
    print('dataContacts : $dataContacts');
  }

  void _saveEditing() {
    setState(() {
      if (editingIndex != -1) {
        // Save changes for the editing contact
        dataContacts[editingIndex]["name"] = inputController1.text;
        dataContacts[editingIndex]["number"] = inputController2.text;
        isEditing = false;
        editingIndex = -1;

        // Reset controllers
        inputController1.clear();
        inputController2.clear();
      }
    });
  }

  void _showDeleteConfirmationDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Contact'),
          content: Text('Are you sure you want to delete this contact?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _deleteContact(index);
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showEditConfirmationDialog(int index) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Confirmation'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to edit this contact?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                _editContact(index);
                Navigator.of(context).pop();
              },
              child: Text('Edit'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _deleteContact(int index) {
    setState(() {
      dataContacts.removeAt(index);
    });
  }

  void _startEditing(int index) {
    _editContact(index);
  }

 void _editContact(int index) {
  setState(() {
    isEditing = true;
    editingIndex = index;
    inputController1.text = dataContacts[index]["name"] ?? "";
    inputController2.text = dataContacts[index]["number"] ?? "";
  });

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Edit Contact'),
        content: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'New Name',
              ),
              controller: inputController1,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'New Number',
              ),
              controller: inputController2,
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // Simpan perubahan
              Navigator.of(context).pop();
              _saveEditing();
            },
            child: Text('Save'),
          ),
        ],
      );
    },
  );
}

}
