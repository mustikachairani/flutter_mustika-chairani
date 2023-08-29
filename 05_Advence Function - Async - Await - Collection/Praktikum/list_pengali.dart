Future<List<int>> duaParameter(List<int> data, int pengali) async {
  List<int> hasil = [];

  for (int angka in data) {
    int hasilKali = angka * pengali;
    hasil.add(hasilKali);
    await Future.delayed(Duration(seconds: 1));
  }
  return hasil;
}

void main() async {
  List<int> data = [1, 2, 3, 4, 5];
  int pengali = 2;

  List<int> hasil = await duaParameter(data, pengali);
  print("Hasil perkalian: $hasil");
}
