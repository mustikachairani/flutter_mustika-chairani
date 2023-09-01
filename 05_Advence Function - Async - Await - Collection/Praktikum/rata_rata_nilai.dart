void main() {
  List<double> nilai = [7, 5, 3, 5, 2, 1];
 double total = 0;

  for (var nilaiIndividu in nilai) {
    total += nilaiIndividu;
  }

  double rataRata = total / nilai.length;
  print("Nilai rata - rata: $rataRata");
}
