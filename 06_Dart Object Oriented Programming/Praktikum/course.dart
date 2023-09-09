class Course {
  String judul;
  String deskripsi;

  Course(this.judul, this.deskripsi);
}

class Student {
  String nama;
  String kelas;
  List<Course> daftarCourse = [];

  Student(this.nama, this.kelas);

  void tambahCourse(Course course) {
    daftarCourse.add(course);
  }

  void hapusCourse(Course course) {
    daftarCourse.remove(course);
  }

  void lihatDaftarCourse() {
    if (daftarCourse.isEmpty) {
      print("Daftar course kosong.");
    } else {
      print("Daftar course untuk $nama ($kelas):");
      for (var course in daftarCourse) {
        print("- ${course.judul}: ${course.deskripsi}");
      }
    }
  }
}

void main() {
  Course course1 = Course("Matematika", "Materi matematika dasar");
  Course course2 = Course("Bahasa Inggris", "Materi bahasa Inggris tingkat dasar");
  Course course3 = Course("Sejarah", "Materi sejarah Indonesia");

  Student student1 = Student("\nAndi", "Kelas 10A");
  Student student2 = Student("\nPutri", "Kelas 11B");

  student1.tambahCourse(course1);
  student1.tambahCourse(course2);

  student2.tambahCourse(course2);
  student2.tambahCourse(course3);

  student1.lihatDaftarCourse();
  student2.lihatDaftarCourse();

  student1.hapusCourse(course2);
  student2.hapusCourse(course3);

  student1.lihatDaftarCourse();
  student2.lihatDaftarCourse();
}
