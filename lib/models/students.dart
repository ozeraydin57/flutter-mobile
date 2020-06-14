class Student {
  String firstName;
  String lastName;
  int grade;

  Student(String firstName, String lastName, int grade, [String status]) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  String get getStatus{
    String mesaj="";
    if (this.grade >= 50)
      mesaj = "Geçti";
    else if (this.grade >= 40)
      mesaj = "Bütünleme!";
    else
      mesaj = "Kaldı!";
    return mesaj;
  }
}