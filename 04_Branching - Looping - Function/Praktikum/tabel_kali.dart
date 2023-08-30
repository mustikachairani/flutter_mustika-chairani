void main() {
  int angka = 9;
  print("Tabel Perkalian $angka x $angka");
  for (int i = 1; i <= angka; i++) {
    String tabelKali = " ";
    for (var j = 1; j <= angka; j++) {
      tabelKali += "${i * j}\t";
    }
    print(tabelKali);
  }
}
