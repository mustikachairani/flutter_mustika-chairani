# Installation Command Line Interface and Package Management in Flutter

Flutter CLI (Command Line Interface) adalah alat penting dalam pengembangan aplikasi menggunakan Flutter SDK. CLI memungkinkan pengembang berinteraksi dengan SDK melalui perintah yang dapat dieksekusi dalam terminal. Beberapa perintah utama yang tersedia meliputi:

- flutter create: Digunakan untuk membuat proyek Flutter baru.
- flutter run: Digunakan untuk menjalankan aplikasi.
- flutter doctor: Digunakan untuk memeriksa konfigurasi pengembangan.
- flutter upgrade: Digunakan untuk memperbarui SDK Flutter ke versi terbaru.

Selain perintah dasar, CLI juga menyediakan perintah lain yang berguna dalam pengembangan, termasuk:

- flutter emulators: Digunakan untuk mengelola emulator yang dapat digunakan untuk menguji aplikasi di berbagai perangkat.
- flutter channel: Memungkinkan pengembang untuk beralih antara saluran Flutter yang berbeda untuk menguji pembaruan eksperimental.
- flutter pub: Digunakan untuk mengelola paket pihak ketiga. Pengembang dapat menambahkan paket yang dibutuhkan dari pub.dev menggunakan flutter pub add dan memastikan semua paket terinstall dengan flutter pub get.

Selain itu, pengembang juga dapat meningkatkan fungsionalitas aplikasi dengan menambahkan paket pihak ketiga. Ini dilakukan dengan mencari paket yang dibutuhkan di pub.dev, menyalin dependencies ke file pubspec.yaml, dan menjalankan flutter pub get di terminal.
