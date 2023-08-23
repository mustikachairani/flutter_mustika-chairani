void main() {
  print("Faktorial dari 10 = ${faktorial(10)}");
  print("Faktorial dari 40 = ${faktorial(40)}");
  print("Faktorial dari 50 = ${faktorial(50)}");
}

BigInt faktorial(int n) {
  if (n == 0 || n == 1) {
    return BigInt.one;
  } else {
    return BigInt.from(n) * faktorial(n-1);}
}