import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  final List<Map<String, String>> contacts;

  const ContactList({required this.contacts});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: contacts.length,
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
            title: Text('${contacts[index]["nama"]}'),
            subtitle: Text('${contacts[index]["nomer"]}'),
            trailing: Wrap(
              children: [
                IconButton(
                  onPressed: () {
                    // Implement delete functionality
                  },
                  icon: Icon(Icons.delete),
                ),
                IconButton(
                  onPressed: () {
                    // Implement edit functionality
                  },
                  icon: Icon(Icons.edit),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
