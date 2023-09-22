import 'package:flutter/material.dart';

void main() {
  runApp(const HelloWorld());
}

class HelloWorld extends StatefulWidget {
  const HelloWorld({super.key});

  @override
  State<HelloWorld> createState() => _HelloWorldState();
}

class _HelloWorldState extends State<HelloWorld> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('My Flutter App'),
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
          ),
          body: Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cover',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8.0,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Pilih File'),
                      style: ElevatedButton.styleFrom(primary: Colors.grey),
                    )),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Publish At',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                DatePickerWidget(),
              ],
            ),
          )),
    );
  }
}

class DatePickerWidget extends StatefulWidget {
  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(' ${selectedDate.toLocal()}'.split(' ')[0]),
        TextButton(
          onPressed: () => _selectDate(context),
          child: Text('Pilih Tanggal'),
        ),
      ],
    );
  }
}
