import 'package:ecommerce/models/students.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  List<Student> students = [
    new Student("Enfin", "Demiroğ", 65),
    new Student("Kerem", "Savaş", 35),
    new Student("Özer", "aydın", 90),
    new Student("Gökan", "aydın", 65),
    new Student("Özweer", "aydın", 50),
    new Student("Hayriye", "aydın", 45),
    new Student("Halit", "kerem", 30),
    new Student("Hakkı", "muratoğlu", 60),
    new Student("Ali", "aydın", 49),
    new Student("Ayşe", "kalender", 25),
    new Student("Fatma", "aydın", 55),
  ];

  var ogrenciler = ["Engin Demir", "Ali buldu", "Özer Aydın", "Veli buldu", "Ayşe aydın", "Fatma gül"];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Öğrenci takip sistemi"),
        ),
        body: buildBody(context));
  }

  String sinavHesapla(int puan) {
    String mesaj = "";
    if (puan >= 50)
      mesaj = "Geçti";
    else if (puan >= 40)
      mesaj = "bütünlemeye kaldı";
    else
      mesaj = "kaldı";
    return mesaj;
  }

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("Sınav sonucu"),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://cdn.pixabay.com/photo/2016/01/19/17/19/young-woman-1149643_960_720.jpg"),
                    ),
                    title: Text(students[index].firstName + " " + students[index].lastName),
                    subtitle:
                        Text("Sınav notu : " + students[index].grade.toString() + " [" + students[index].getStatus + "]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      var mesaj = sinavHesapla(students[index].grade);
                      mesajGoster(context, mesaj);
                    },
                  );
                })),
        Center(
            child: RaisedButton(
          child: Text("Soncu gör.."),
          onPressed: () {},
        )),
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50)
      return Icon(Icons.done);
    else if (grade >= 40)
      return Icon(Icons.warning);
    else
      return Icon(Icons.remove);
  }
}
