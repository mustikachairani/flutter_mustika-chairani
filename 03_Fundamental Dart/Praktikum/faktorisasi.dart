void main() {
  int bilangan = 24;

  print("Faktor dari $bilangan adalah : ");
  for (var i = 1; i <= bilangan; i++) {
    if (bilangan % i == 0) {
      print(i);
    }
    
  }
}
