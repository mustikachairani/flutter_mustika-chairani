// lib/viewModel/contact_view_model.dart
import 'package:flutter/foundation.dart';

class ContactViewModel extends ChangeNotifier {
  List<String> _contacts = [];

  List<String> get contacts => _contacts;

  // Fungsi untuk menambahkan kontak
  void addContact(String contact) {
    _contacts.add(contact);
    notifyListeners();
  }

  // Fungsi untuk menghapus kontak berdasarkan indeks
  void removeContact(int index) {
    _contacts.removeAt(index);
    notifyListeners();
  }

  // Fungsi untuk mengedit kontak berdasarkan indeks
  void editContact(int index, String newContact) {
    _contacts[index] = newContact;
    notifyListeners();
  }

  // Fungsi untuk mendapatkan jumlah kontak
  int getContactsCount() {
    return _contacts.length;
  }

  // Fungsi untuk mendapatkan kontak berdasarkan indeks
  String getContactAtIndex(int index) {
    return _contacts[index];
  }
}
