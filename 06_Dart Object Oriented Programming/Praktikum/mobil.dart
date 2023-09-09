import 'hewan.dart';

class Mobil {
  double kapasitas;
  List<Hewan> muatan = [];

  Mobil(this.kapasitas);

  void tambahMuatan(Hewan hewan) {
    if (muatan.length < kapasitas) {
      muatan.add(hewan);
      print(
          '${hewan.nama} (${hewan.berat} kg) berhasil ditambahkan ke dalam muatan mobil');
    } else {
      print('Muatan penuh, Anda tidak dapat menambahkan ${hewan.nama}');
    }
  }

  int totalMuatan() {
    return muatan.length;
  }
}

void main() {
  var mobil = Mobil(5);
  var sapi = Hewan('Sapi', 500.0);
  var ayam = Hewan('Ayam', 2.0);
  var kambing = Hewan('Sapi', 50.0);

  mobil.tambahMuatan(sapi);
  mobil.tambahMuatan(ayam);
  mobil.tambahMuatan(kambing);

  var total = mobil.totalMuatan();
  print("Total muatan dalam mobil: $total hewan ");
}
