bool isPalingdrom(String kata) {
  String reversedkata = kata.split('').reversed.join('');
  return kata == reversedkata;
}

void main() {
  String input1 = "kasur rusak";
  String input2 = "mobil balap";

  bool hasil1 = isPalingdrom(input1.replaceAll(' ', ' '));
  bool hasil2 = isPalingdrom(input2.replaceAll(' ', ' '));

  if (hasil1) {
    print("$input1 adalah palindrom");
  } else {
    print("$input1 bukan palindrom");
  }

 if (hasil2) {
    print("$input2 adalah palindrom");
  } else {
    print("$input2 bukan palindrom");
  }
  
}
