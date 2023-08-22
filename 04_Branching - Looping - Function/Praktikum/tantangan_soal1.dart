double buku = 10000;
double pensil = 5000;
double tas = 100000;

void main(){
  print (tas);
  menghitungPembelian();
  print (menghitungPembelian());
}
double menghitungPembelian(){
  return buku + pensil + tas;
}