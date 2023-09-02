Future<int> hitungFaktorial(int angka) async {
  int faktorial = 1;

  for (int i = 1; i <= angka; i++) {
    faktorial *= i;
    await Future.delayed(Duration(seconds: 1));
  }
  return faktorial;
}

void main() async {
  int angka = 5;
  int hasilFaktorial = await hitungFaktorial(angka);
  print("Faktorial dari angka $angka adalah = $hasilFaktorial");
  
}
