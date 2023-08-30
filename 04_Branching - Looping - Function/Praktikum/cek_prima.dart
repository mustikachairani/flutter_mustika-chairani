bool cekPrima(int angka) {
  if (angka <= 1) {
    return false;
  }
  for (int i = 2; i <= angka / 2; i++) {
    if (angka % i == 0) {
      return false;
    }
  }
  return true;
}

void main() {
  int bilangan = 23;

  if (cekPrima(bilangan)) {
    print("$bilangan adalah bilangan prima");
  } else {
    print("$bilangan bukan bilangan prima");
  }
}
