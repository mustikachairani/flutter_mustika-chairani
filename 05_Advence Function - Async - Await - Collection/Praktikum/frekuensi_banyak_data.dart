Map<String, int> hitungFrekuensi(List<String> data) {
  Map<String, int> frekuensi = {};

  for (String nilai in data) {
    if (frekuensi.containsKey(nilai)) {
      frekuensi[nilai] = frekuensi[nilai]! + 1;
    } else {
      frekuensi[nilai] = 1;
    }
  }
  return frekuensi;
}

void main() {
  List<String> sampelData = [
    "js",
    "js",
    "js",
    "golang",
    "python",
    "js",
    "js",
    "golang",
    "rust"
  ];
  Map<String, int> frekuensi = hitungFrekuensi(sampelData);
  frekuensi.forEach((data, jumlah) {
    print("$data: $jumlah");
  });
}
