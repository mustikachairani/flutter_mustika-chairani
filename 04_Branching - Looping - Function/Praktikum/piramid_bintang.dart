void main() {
  int piramid = 8;

  for (int i = 1; i <= piramid; i++) {
    print('   ' * (piramid - i) + '  *' * (2 * i - 1));
  }
}
