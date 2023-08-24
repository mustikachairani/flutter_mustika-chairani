double luasLingkaran(double jariJari) {
  double luas = 3.14 * jariJari;
  return luas;
}

void main() {
  double jariJari = 5;
  double luas = luasLingkaran(jariJari);
  print("Luas lingkaran dengan jari-jari $jariJari adalah $luas");
}
