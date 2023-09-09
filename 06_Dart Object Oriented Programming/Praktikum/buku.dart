class Buku {
  int id;
  String judul;
  String penerbit;
  double harga;
  String kategori;

  Buku(this.id, this.judul, this.penerbit, this.harga, this.kategori);
}

class TokoBuku {
  List<Buku> daftarBuku = [];

  void tambahBuku(Buku buku) {
    daftarBuku.add(buku);
  }

  List<Buku> semuaBuku() {
    return daftarBuku;
  }

  void hapusBuku(int id) {
    daftarBuku.removeWhere((buku) => buku.id == id);
  }
}

void main() {
  TokoBuku tokoBuku = TokoBuku();

  // Menambahkan beberapa buku ke toko
  Buku buku1 = Buku(1, "Harry Potter", "Gramedia", 100.0, "Fiksi");
  Buku buku2 = Buku(2, "Lord of the Rings", "Elex Media", 120.0, "Fantasi");
  Buku buku3 = Buku(3, "To Kill a Mockingbird", "Gramedia", 80.0, "Fiksi");

  tokoBuku.tambahBuku(buku1);
  tokoBuku.tambahBuku(buku2);
  tokoBuku.tambahBuku(buku3);

  // Mendapatkan semua data buku
  List<Buku> semuaBuku = tokoBuku.semuaBuku();
  print("Daftar Semua Buku:");
  for (var buku in semuaBuku) {
    print("ID: ${buku.id}, Judul: ${buku.judul}, Penerbit: ${buku.penerbit}, Harga: ${buku.harga}, Kategori: ${buku.kategori}");
  }

  // Menghapus buku berdasarkan ID
  int idBukuDihapus = 2;
  tokoBuku.hapusBuku(idBukuDihapus);

  // Mendapatkan semua data buku setelah menghapus
  semuaBuku = tokoBuku.semuaBuku();
  print("\nDaftar Semua Buku Setelah Menghapus Buku dengan ID $idBukuDihapus:");
  for (var buku in semuaBuku) {
    print("ID: ${buku.id}, Judul: ${buku.judul}, Penerbit: ${buku.penerbit}, Harga: ${buku.harga}, Kategori: ${buku.kategori}");
  }
}
