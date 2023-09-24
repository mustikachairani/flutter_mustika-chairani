import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(const InteraktifWidget());
}

class InteraktifWidget extends StatefulWidget {
  const InteraktifWidget({super.key});

  @override
  State<InteraktifWidget> createState() => _InteraktifWidgetState();
}

class _InteraktifWidgetState extends State<InteraktifWidget> {
  String _selectedFieldPath = '';
  Color _selectedColor = Colors.amber;
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Interactive Widget')),
      ),
      body: Container(
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.all(5.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                            primary: Colors.blue, onPrimary: Colors.white),
                        onPressed: _pickColor,
                        child: Text(
                          'Pick Color',
                        ))),
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
                  )
              ],
            )
          ],
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
                  }),
            ),
          );
        });
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
