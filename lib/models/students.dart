class Student {
  int id;
  String firstName;
  String lastName;
  int grade;

  Student.WithId(int id, String firstName, String lastName, int grade, [String status]) {
    this.id=id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  Student(String firstName, String lastName, int grade, [String status]) {
    this.id=id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  Student.WithoutInfo();

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