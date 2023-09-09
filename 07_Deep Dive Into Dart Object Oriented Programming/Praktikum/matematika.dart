abstract class Matematika {
  int x;
  int y;

  Matematika(this.x, this.y);

  int get persekutuan_terbesar;
  int get persekutuan_terkecil;
}

class PersekutuanTerkecil implements Matematika {
  int x;
  int y;

  PersekutuanTerkecil(this.x, this.y);

  int get persekutuan_terbesar {
    int nilaiTerbesar = x > y ? x : y;
    int persekutuanTerkecil = nilaiTerbesar;

    while (true) {
      if (persekutuanTerkecil % x == 0 && persekutuanTerkecil % y == 0) {
        return persekutuanTerkecil;
      }
      persekutuanTerkecil += nilaiTerbesar;
    }
  }

  int get persekutuan_terkecil => (x * y) ~/ persekutuan_terbesar; 
}

class PersekutuanTerbesar implements Matematika {
  int x;
  int y;

  PersekutuanTerbesar(this.x, this.y);

  int get persekutuan_terbesar {
    while (y != 0) {
      int nilaiY = y;
      y = x % y;
      x = nilaiY;
    }
    return x;
  }

  int get persekutuan_terkecil => (x * y) ~/ persekutuan_terbesar; 
}

void main() {
  Matematika hitungPersekutuanTerkecil = PersekutuanTerkecil(12, 18);
  Matematika hitungPersekutuanTerbesar = PersekutuanTerbesar(24, 20);

  print("Kelipatan Persekutuan Terkecil : ${hitungPersekutuanTerkecil.persekutuan_terbesar}");
  print("Kelipatan Persekutuan Terbesar : ${hitungPersekutuanTerbesar.persekutuan_terbesar}");
}