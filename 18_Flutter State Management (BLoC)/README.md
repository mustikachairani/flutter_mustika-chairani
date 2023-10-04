<h1>Flutter State Management (BLOC)</h1>

Flutter membangun UI secara deklaratif, mencerminkan keadaan state saat ini. State adalah data yang disimpan oleh widget saat aktif. Ada dua jenis state: ephemeral untuk widget yang tidak memerlukan akses dari bagian lain, dan app state untuk data yang dibutuhkan di berbagai bagian aplikasi.

Ephemeral state, seperti pada PageView atau Switch Button, tidak memerlukan state management kompleks, hanya setState pada stateful widget. App state digunakan untuk data yang dibutuhkan di berbagai bagian aplikasi, seperti login info atau preferensi pengguna.

SetState cocok untuk ephemeral state, sedangkan Provider direkomendasikan untuk state management yang kompleks seperti app state. Bloc menggunakan pola stream/observable untuk memisahkan UI dari logika bisnisnya. Sehingga, Flutter menawarkan pendekatan yang fleksibel sesuai dengan kompleksitas kebutuhan state management aplikasi.