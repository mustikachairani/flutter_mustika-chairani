// lib/model/contact_model.dart
import 'package:flutter/foundation.dart';

class ContactModel extends ChangeNotifier {
  List<Map<String, String>> _dataKontak = [];

  List<Map<String, String>> get dataKontak => _dataKontak;

  void addContact(Map<String, String> contact) {
    _dataKontak.add(contact);
    notifyListeners();
  }

  void removeContact(int index) {
    _dataKontak.removeAt(index);
    notifyListeners();
  }
}
