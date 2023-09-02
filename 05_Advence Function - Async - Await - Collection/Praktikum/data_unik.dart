List<String> hapusDuplikat(List<String> data) {
  List<String> listUnik = [];
  for (String nama in data) {
    if (!listUnik.contains(nama)) {
      listUnik.add(nama);
    }
  }
  return listUnik;
}

void main() {
  List<String> data1 = [
    "amuse",
    "tommy kaira",
    "spoon",
    "HKS",
    "litchfield",
    "amuse",
    "HKS"
  ];
  List<String> hasilData1 = hapusDuplikat(data1);
  print("Sampel hasildata1 adalah = $hasilData1");

  List<String> data2 = [
    "JS Racing",
    "amuse",
    "spoon",
    "spoon",
    "JS Racing",
    "amuse"
  ];
  List<String> hasilData2 = hapusDuplikat(data2);
  print("Sampel hasildata1 adalah = $hasilData2");
}
