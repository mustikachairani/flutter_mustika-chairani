class BangunRuang {
  double panjang;
  double lebar;
  double tinggi;

  BangunRuang(this.panjang, this.lebar, this.tinggi);

  double volume() {
    return panjang * lebar * tinggi;
  }
}

class Kubus extends BangunRuang {
  Kubus(double sisi) : super(sisi, sisi, sisi);
}

class Balok extends BangunRuang {
  Balok(double panjang, double lebar, double tinggi)
      : super(panjang, lebar, tinggi);
}

void main() {
  Kubus kubus = Kubus(5.0);
  Balok balok = Balok(4.0, 3.0, 2.0);

  print("Volume Kubus : ${kubus.volume()}");
  print("Volume Balok : ${balok.volume()}");

}
