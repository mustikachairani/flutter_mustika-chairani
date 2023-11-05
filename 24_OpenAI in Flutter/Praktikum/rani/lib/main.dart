import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var jawaban = "";
  TextEditingController pertanyaanController =
      TextEditingController(); // Controller untuk input pertanyaan
  TextEditingController budgetController =
      TextEditingController(); // Controller untuk input budget
  TextEditingController cameraController =
      TextEditingController(); // Controller untuk input kamera
  TextEditingController storageController =
      TextEditingController(); // Controller untuk input penyimpanan

  void _askGPT() async {
    String apiKey = ''; // Ganti dengan API Key OpenAI Anda
    Dio dio = Dio(BaseOptions(
      baseUrl: 'https://api.openai.com/v1',
      headers: {
        'Authorization': 'Bearer $apiKey', // Mengatur kunci API
        'Content-Type': 'application/json',
      },
    ));

    String pertanyaan = pertanyaanController.text;
    double budget = double.tryParse(budgetController.text) ?? 0.0;
    int cameraMP = int.tryParse(cameraController.text) ?? 0;
    int storageGB = int.tryParse(storageController.text) ?? 0;

    // Membuat data yang akan dikirim
    Map<String, dynamic> data = {
      "model": "gpt-3.5-turbo",
      "messages": [
        {
          "role": "system",
          "content":
              "kamu adalah orang yang handal dalam memberikan saran handphone yang cocok sesuai kebutuhan anda memberrikan penjelasan detail mengenai handphone itu .",
        },
        {
          "role": "user",
          "content": pertanyaan,
        },
        {
          "role": "user",
          "content":
              "Budget: $budget, Camera: $cameraMP MP, Storage: $storageGB GB",
        },
      ],
      "temperature": 1,
      "max_tokens": 256,
      "top_p": 1,
      "frequency_penalty": 0,
      "presence_penalty": 0
    };

    try {
      Response response = await dio
          .post('https://api.openai.com/v1/chat/completions', data: data);

      // Menyimpan pesan dari respons JSON
      String message = response.data['choices'][0]['message']['content'];

      setState(() {
        jawaban = message;
      });

      print('respond : $message');
    } on Exception catch (e) {
      print(e);
    }
    print("submit");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Phone Recommendation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller:
                      pertanyaanController, // Menghubungkan controller ke TextField
                  decoration: InputDecoration(labelText: 'Masukkan pertanyaan'),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: budgetController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Budget'),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: cameraController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Camera (MP)'),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: storageController,
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: 'Internal Storage (GB)'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    _askGPT();
                  },
                  child: Text("submit"),
                ),
                Divider(),
                Text("Jawaban"),
                Text(jawaban),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
