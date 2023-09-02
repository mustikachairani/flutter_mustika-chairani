Future<int> hitungFaktorial(int angka) {
  int faktorial = 1;

  return Future(() {
    for (int i = 1; i <= angka; i++) {
      faktorial *= i;
    }
    return faktorial;
  });
}

void main() {
  int angka = 5;
  hitungFaktorial(angka).then((hasilFaktorial) {
    print("Faktorial dari angka $angka adalah = $hasilFaktorial");
  });
}
