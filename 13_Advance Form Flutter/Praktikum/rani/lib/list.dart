import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List data_kontak = [
  {
    "nama": "Name 1",
    "nomer": "0897654321",
  },
  {
    "nama": "Name 2",
    "nomer": "0897654321",
  },
  {
    "nama": "Name 3",
    "nomer": "0897654321",
  },
  {
    "nama": "Name 4",
    "nomer": "0897654321",
  },
  {
    "nama": "Name 5",
    "nomer": "0897654321",
  },
  {
    "nama": "Name 6",
    "nomer": "0897654321",
  },
  {"nama": "Guru Biologi", "nomer": "Laki-laki"}
]; // data  akan  kita dapatkan dari API temen2 back end

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HelloWord();
  }
}

class HelloWord extends StatefulWidget {
  const HelloWord({super.key});

  @override
  State<HelloWord> createState() => _HelloWordState();
}

class _HelloWordState extends State<HelloWord> {
  var inputControllers1 = TextEditingController();
  var inputControllers2 = TextEditingController();
  var dropDownValue = 0;
  var checkValue = false;
  var inputControllers = TextEditingController();
  var radioValue = '';
  List<String> checkboxValue = [];
  var isCheckbox1 = false;
  String textFieldData = ''; // Tambahkan ini
  //dua variabel yang dibuat jika ingin menggunakan date
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
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
                ],
              ),
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
              TextField(
                controller: inputControllers,
                onChanged: (inputControllers) {
                  print('$inputControllers');
                },
              ),
              Row(
                children: [
                  Radio(
                      value: 'Laki-laki',
                      groupValue: radioValue,
                      onChanged: (String? value) {
                        setState(() {
                          //logic dari radio button itu  dimasukkan
                          radioValue = value ?? '';
                          print('Nilai  dari radio value =  $radioValue');
                        });
                      }),
                  Text('Laki - laki'),
                ],
              ),

              Row(
                children: [
                  Radio(
                      value: 'Perempuan',
                      groupValue: radioValue,
                      onChanged: (String? value) {
                        setState(() {
                          //logic dari radio button itu  dimasukkan
                          radioValue = value ?? '';
                          print('Nilai  dari radio value =  $radioValue');
                        });
                      }),
                  Text('Perempuan'),
                ],
              ),
              //checkbox simple
              Divider(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Date'),
                  TextButton(
                    onPressed: () {
                       _selectDate(context);
                    },
                    child: Text('Select'),
                  ),
                ],
              ),
              Text(DateFormat('dd-MM-yyy').format(_dueDate)),


              Center(
                child: ElevatedButton(
                  child: Text('Submit'),
                  onPressed: () {
                    setState(() {
                      data_kontak.add({
                        "nama": "${inputControllers.text}",
                        "nomer": "$radioValue",
                        "skill": "$checkboxValue"
                      });
                    });
              
                    print('data_kontak : $data_kontak');
                  },
                ),
              ),
              SizedBox(
                  height: 200,
                  child: ListView.builder(
                      itemCount: data_kontak.length, //3
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: FlutterLogo(),
                          title: Text('${data_kontak[index]["nama"]}'),
                          subtitle:
                              Text('${data_kontak[index]["nomer"]}'),
                          trailing: Wrap(children: [
                            IconButton(
                                onPressed: () {
                                  //1. kita harus memasukkan datanya ke dalam onpress
                                  // print('delete $data_kontak');
                                  //2. setelah didapatkan datanya, maka kita olah sehingga data tersebut dihapus ketika tombol di tekah
                                  setState(() {
                                    data_kontak.removeAt(index);
                                  });
                                },
                                icon: Icon(Icons.delete)),
                            IconButton(
                                onPressed: () => AlertEdit(context, index),
                                icon: Icon(Icons.edit))
                          ]),
                        );
                      })),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Future<String?> AlertEdit(BuildContext context, int index) {
    final contact = data_kontak[index]['title'];
    final radioJenisKelamin = data_kontak[index]['jenis_kelamin'];
    TextEditingController nameControllerEdit =
        TextEditingController(text: contact);

    return showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('AlertDialog Title'),
              content: Column(children: [
                Text('nama'),
                TextField(
                  controller: nameControllerEdit,
                ),
                // buat radio button
                // dalem value di radio button, kamu masukin set up valuenya sama dengan radioJenisKelamin
              ]),
              actions: [
                TextButton(
                    onPressed: () {
                      //logika untuk menindih value berdsarkan index
                      print(data_kontak);
                      setState(() {
                        data_kontak[index]["nama"] = nameControllerEdit.text;
                      });
                      Navigator.pop(context);
                      print(data_kontak);

                      print('submit edit');
                    },
                    child: Text('Submit Edit')),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, 'Cancel');
                    },
                    child: Text('Cancel'))
              ],
            )
        // 1. kita panggil semua data
        // print('edit $data_kontak');
        // 2. munculin box baru (show dialog/alert dialog)
        // 3. di dalam box itu (show dialog/alert dialog) membuat form untuk memperharui data
        // 4. masukkan data sebelumnya ke alert dialog tersebut(tempat kita untuk mendapatkan data baru)
        // 5. ketika button di klik, maka data akan berganti
        );
  }
  
  Future<void> _selectDate(BuildContext context) async {
  var showDatePicker2 = showDatePicker(
    context: context,
    initialDate: _dueDate, // Gunakan _dueDate sebagai tanggal awal
    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
  );
  final DateTime? pickedDate = await showDatePicker2;

  if (pickedDate != null && pickedDate != _dueDate) {
    setState(() {
      _dueDate = pickedDate; // Perbarui _dueDate dengan tanggal yang dipilih
    });
  }
}

}
