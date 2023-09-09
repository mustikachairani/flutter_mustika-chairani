abstract class Matematika {
  int x;
  int y;

  Matematika(this.x, this.y);

  int hasil();
}

class PersekutuanTerkecil implements Matematika {
  int x;
  int y;

  PersekutuanTerkecil(this.x, this.y);

  int hasil() {
    int nilaiTerbesar = x > y ? x : y;
    int persekutuanTerkecil = nilaiTerbesar;

    while (true) {
      if (persekutuanTerkecil % x == 0 && persekutuanTerkecil % y == 0) {
        return persekutuanTerkecil;
      }
      persekutuanTerkecil += nilaiTerbesar;
    }
  }
}

class PersekutuanTerbesar implements Matematika {
  int x;
  int y;

  PersekutuanTerbesar(this.x, this.y);

  int hasil() {
    while (y != 0) {
      int nilaiY = y;
      y = x % y;
      x = nilaiY;
    }
    return x;
  }
}

void main() {
  Matematika hitungPersekutuanTerkecil = PersekutuanTerkecil(12, 18);
  Matematika hitungPersekutuanTerbesar = PersekutuanTerbesar(24, 20);

  print("Kelipatan Persekutuan Terkecil : ${hitungPersekutuanTerkecil.hasil()}");
  print("Kelipatan Persekutuan Terbesar : ${hitungPersekutuanTerbesar.hasil()}");
}
