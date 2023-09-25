<h1>Flutter Form(Form input Button)</h1>

Materi ini menjelaskan tentang penggunaan Flutter dalam pembuatan formulir dan elemen-elemen input dalam pengembangan aplikasi. Berikut kesimpulan dari materi tersebut:

1. Form
Form digunakan untuk menerima isian data dari pengguna, baik satu atau lebih. Pembuatan form menggunakan Stateful Widget, dan keadaan form dapat diatur menggunakan GlobalKey<FormState>.

2. Input
   - TextField: Digunakan untuk menerima isian data teks dari pengguna, dan data diambil menggunakan TextEditingController.
   - Radio: Memberi opsi tunggal kepada pengguna, yang hanya dapat memilih satu opsi. Data dipilih dengan menggunakan properti yang sesuai dengan nilai (value) pada radio.
   - Checkbox: Memberi opsi ganda kepada pengguna, yang dapat memilih beberapa opsi sekaligus.
   - DropdownButton: Memberi opsi tunggal kepada pengguna, dengan opsi yang awalnya tidak terlihat dan hanya muncul saat diaktifkan. Data diambil menggunakan properti yang sesuai dengan nilai (value) pada MenuItem dropdown.

3. Button
   - ElevatedButton: Tombol yang menonjol dan dapat menjalankan fungsi (onPress) saat ditekan.
   - IconButton: Tombol yang hanya menampilkan ikon dan juga dapat menjalankan fungsi (onPress) saat ditekan.

Pengembangan Flutter dapat membuat formulir interaktif dan mengumpulkan data dari pengguna dengan berbagai jenis input, serta memberikan kemampuan untuk merespons tindakan pengguna melalui tombol-tombol yang sesuai.