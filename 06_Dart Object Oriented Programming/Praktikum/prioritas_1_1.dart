class Hewan {
  String nama;
  double berat;

  Hewan(this.nama, this.berat);

  void beratBadan() {
    print("Nama : $nama");
    print("Berat : $berat");
  }
}

void main() {
  var hewan1 = Hewan('Kucing', 5);
  var hewan2 = Hewan('Sapi', 400);

  print("Informasi Hewan 1: ");
  hewan1.beratBadan();

  print("\nInformasi hewan 2: ");
  hewan2.beratBadan();
}
