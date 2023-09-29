<h1>Flutter Navigation</h1>

- Navigasi dalam Flutter merupakan konsep penting dalam pengembangan aplikasi mobile. Ada beberapa cara untuk melakukan navigasi. Pertama, navigasi dasar dapat dicapai dengan menggunakan `Navigator.push` untuk berpindah dari satu halaman ke halaman lain dalam aplikasi, dan untuk kembali ke halaman sebelumnya, kita dapat menggunakan `Navigator.pop`.

- Navigasi dengan Named Routes memungkinkan setiap halaman memiliki alamat yang disebut "routes." Untuk berpindah ke halaman baru, digunakan `Navigator.pushNamed`, dan untuk kembali ke halaman sebelumnya, tetap dapat menggunakan `Navigator.pop`.

- Untuk mendaftarkan rute (routes) ini, kita perlu menambahkan properti `initialRoute` pada widget `MaterialApp`, dan setiap route diwakili oleh sebuah fungsi yang membentuk halaman yang sesuai.

- Untuk mengirim data ke halaman baru, kita dapat menggunakan argumen saat melakukan `pushNamed`. Dengan begitu, Flutter memberikan fleksibilitas dalam mengelola navigasi dan berbagi data antara halaman-halaman dalam aplikasi Flutter.