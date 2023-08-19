// menghitung luas dan keliling persegi 
// menghitung luas dan keliling persegi  panjang

int sisi = 5;
int panjang = 15;
int lebar = 7;

int keliling_persegi = 4*sisi;
int luas_persegi = sisi*sisi;
int keliling_persegi_panjang = 2*(panjang+lebar);
int luas_persegi_panjang = panjang*lebar;

void main(){
  print('Keliling dari persegi panjang adalah $keliling_persegi_panjang ');
  print('keliling dari persegi adalah $keliling_persegi');
  print('Luas dari persegi panjang adalah $luas_persegi_panjang ');
  print('Luas dari persegi adalah $luas_persegi');

}