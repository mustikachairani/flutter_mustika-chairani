void main() {
  int jampasir = 6;

  for (int i = 1; i <= jampasir; i++) {
    print('  ' * (i - 1) + ' 0' * (2 * (jampasir - i) + 1));
  }

  for (int i = jampasir - 1; i >= 1; i--) {
    print('  ' * (i - 1) + ' 0' * (2 * (jampasir - i) + 1));
  }
}
