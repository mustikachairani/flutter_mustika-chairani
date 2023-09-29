import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        title: Center(
            child: Row(
          children: [
            Center(child: Text('Fox Music')),
          ],
        )),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'assets/Musik.jpg',
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                'Contact Us',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Need to get in touch with us? Either fill out the form with your inquiry or find the department email you would like to contact below',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 17,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('First Name'),
                        TextField(
                          controller: _firstNameController,
                          decoration: InputDecoration(
                            hintText: 'Insert Youre first name',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.text,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Last Name'),
                        TextField(
                          controller: _lastNameController,
                          decoration: InputDecoration(
                            hintText: 'Insert Youre last name',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.text,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email'),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Insert Youre email address',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.text,
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('What can we help you with?'),
                  TextField(
                    maxLines: 5,
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: '',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.text,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  String firstName = _firstNameController.text;
                  String lastName = _lastNameController.text;
                  String email = _emailController.text;
                  String message = _messageController.text;

                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Form Data User'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('First Name : $firstName'),
                              Text('Last Name : $lastName'),
                              Text('Email Address : $email'),
                              Text('Message : $message'),
                            ],
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('close'))
                          ],
                        );
                      });
                },
                child: Text('Submit'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.purple),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
