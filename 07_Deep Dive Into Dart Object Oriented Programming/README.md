# Deep Dive Into Dart Object Oriented Programming

Konsep-konsep dasar dalam pemrograman berorientasi objek yang dapat digunakan untuk mengorganisasi dan memahami struktur kode secara lebih baik, meningkatkan fleksibilitas, dan memungkinkan penggunaan kembali kode dalam pengembangan perangkat lunak.

1. **Constructor**:
   - Method yang dijalankan saat pembuatan objek.
   - Dapat menerima parameter.
   - Tidak memiliki nilai kembalian (return).
   - Nama constructor sama dengan nama Class.
   - Digunakan untuk memberi konstruktor, tambahkan method dengan nama yang sama dengan nama Class.

2. **Inheritance**:
   - Membuat Class baru dengan memanfaatkan Class yang sudah ada.
   - Bertujuan agar kemampuan Class yang sudah ada dapat dimiliki oleh Class baru.
   - Melakukan inheritance dengan menambahkan "extend" saat pembuatan Class baru.
   - Penggunaan class: proses pembuatan objek dari Class yang melakukan inheritance seperti pembuatan objek pada umumnya.

3. **Method Overriding**:
   - Menulis ulang method yang ada pada superclass.
   - Bertujuan agar Class memiliki metode yang sama dengan proses yang berbeda.
   - Dilakukan pada Class yang melakukan inheritance.
   - Method yang sudah ada pada Class induk ditulis ulang seperti membuat method baru pada Class anak.
   - Ditambahkan tanda `@override` di baris sebelum method dibuat.
   - Penggunaan class: proses membuat objek dari Class yang terjadi inheritance seperti pembuatan objek pada umumnya.

4. **Interface**:
   - Berupa Class yang menunjukkan metode apa saja yang ada pada suatu Class.
   - Seluruh method wajib di-override.
   - Digunakan dengan menggunakan "implements".
   - Menggunakan interface: pada Class yang melakukan implementasi wajib melakukan override semua method yang ada pada Class induk.
   - Penggunaan class: proses membuat objek dari Class yang terjadi inheritance seperti pembuatan objek pada umumnya.

5. **Abstrak Class**:
   - Berupa Class abstrak yang menunjukkan metode apa saja yang ada pada suatu Class.
   - Digunakan dengan menggunakan "extend".
   - Tidak dapat membuat objek dari Class abstrak.
   - Tidak semua method harus di-override.

6. **Polimorfisme (Polymorphism)**:
   - Kemampuan data untuk berubah menjadi bentuk lain.
   - Tipe data yang dapat digunakan adalah superclass.
   - Dilakukan pada Class dengan "extend" atau "implement".

7. **Generics**:
   - Dapat digunakan pada Class atau fungsi.
   - Memberi kemampuan agar dapat menerima data dengan tipe yang berbeda.
   - Tipe data yang diinginkan ditentukan saat membuat Class atau menjalankan fungsi.
   - Memungkinkan Class atau fungsi untuk beradaptasi dengan tipe data yang berbeda secara dinamis.

8. **Enkapsulasi**:
   - Mempromosikan penyembunyian data.
   - Peningkatan integritas data.
   - Memungkinkan perubahan pada satu bagian kode tanpa mempengaruhi bagian lain.
   - Modifikasi akses dalam bahasa pemrograman Dart: Publik (public), Private (private), dan Protected (tidak secara alami tetapi konvensional).

9. **Getter dan Setter**:
   - Getter dan setter adalah metode yang memungkinkan akses terkontrol ke variabel private.
   - Mereka memungkinkan enkapsulasi dengan menyediakan cara untuk membaca dan memodifikasi data private dengan validasi atau perhitungan saat diperlukan.
