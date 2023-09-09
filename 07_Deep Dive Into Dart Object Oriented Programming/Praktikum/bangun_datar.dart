abstract class BangunDatar {
  double getArea();
  double getPerimeter();
}

class Segitiga implements BangunDatar {
  double alas;
  double tinggi;
  double sisi1;
  double sisi2;
  double sisi3;

  Segitiga(this.alas, this.tinggi, this.sisi1, this.sisi2, this.sisi3);

  double getArea() {
    return 0.5 * alas * tinggi;
  }

  double getPerimeter() {
    return sisi1 + sisi2 + sisi3;
  }
}

class Persegi implements BangunDatar {
  double sisi;

  Persegi(this.sisi);

  double getArea() {
    return sisi * sisi;
  }

  double getPerimeter() {
    return 4 * sisi;
  }
}

class Lingkaran implements BangunDatar {
  double jariJari;

  Lingkaran(this.jariJari);

  double getArea() {
    return 3.14 * jariJari * jariJari;
  }

  double getPerimeter() {
    return 2 * 3.14 * jariJari;
  }
}

void main() {
  BangunDatar segitiga = Segitiga(6.0, 8.0, 7.0, 7.0, 7.0);
  BangunDatar persegi = Persegi(5.0);
  BangunDatar lingkaran = Lingkaran(7.0);

  double luasSegitiga = segitiga.getArea();
  double kelilingSegitiga = segitiga.getPerimeter();

  double luasPersegi = persegi.getArea();
  double kelilingPersegi = persegi.getPerimeter();

  double luasLingkaran = lingkaran.getArea();
  double kelilingLingkaran = lingkaran.getPerimeter();

  print("Bangun datar segitiga memiliki Luas: $luasSegitiga dan Keliling: $kelilingSegitiga");
  print("Bangun datar persegi memiliki Luas: $luasPersegi dan Keliling: $kelilingPersegi");
  print("Bangun datar lingkaran memiliki Luas: $luasLingkaran dan Keliling: $kelilingLingkaran");
}
