class Calculator {
  double tambah(double a, double b) {
    return a + b;
  }

  double kurang(double a, double b) {
    return a - b;
  }

  double kali(double a, double b) {
    return a * b;
  }

  double bagi(double a, double b) {
    return a / b;
  }
}

void main() {
  Calculator calculator = Calculator();
  double hasilTambah = calculator.tambah(5, 3);
  double hasilKurang = calculator.kurang(10, 4);
  double hasilKali = calculator.kali(6, 2);
  double hasilBagi = calculator.bagi(8, 2);

  print("Hasil Penjumlahan : $hasilTambah");
  print("Hasil Pengurangan : $hasilKurang");
  print("Hasil Perkalian : $hasilKali");
  print("Hasil Pembagian : $hasilBagi");
}
