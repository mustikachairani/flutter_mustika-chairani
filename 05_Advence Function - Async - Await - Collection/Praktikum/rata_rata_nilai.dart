void main() {
  List<int> nilai = [7, 5, 3, 5, 2, 1];
  int total = 0;

  for (var nilaiIndividu in nilai) {
    total += nilaiIndividu;
  }

  double rataRata = total / nilai.length;
  int rataRataPembulatan = (rataRata + 0.5).toInt();
  print("Nilai rata - rata adalah: $rataRataPembulatan");
}
