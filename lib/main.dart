import 'package:ecommerce/models/students.dart';
import 'package:ecommerce/screens/student_add.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState(); // return { return _MyAppState();}
}

class _MyAppState extends State<MyApp> {
  Student selectedStudent = Student.WithId(0, "", "", 0);
  List<Student> students = [
    new Student.WithId(1, "Enfin", "Demiroğ", 65),
    new Student.WithId(2, "Kerem", "Savaş", 35),
    new Student.WithId(3, "Özer", "aydın", 90),
    new Student.WithId(4, "Gökan", "aydın", 65),
    new Student.WithId(5, "Özweer", "aydın", 50),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Öğrenci takip sistemi"),
        ),
        body: buildBody(context));
  }

  void mesajGoster(BuildContext context, String title, String mesaj) {
    var alert = AlertDialog(
      title: Text(title),
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
                      backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2016/01/19/17/19/young-woman-1149643_960_720.jpg"),
                    ),
                    title: Text(students[index].firstName + " " + students[index].lastName),
                    subtitle: Text("Sınav notu : " + students[index].grade.toString() + " [" + students[index].getStatus + "]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      setState(() {
                        selectedStudent = students[index];
                      });
                      //var mesaj = sinavHesapla(students[index].grade);
                      //mesajGoster(context, mesaj);
                    },
                  );
                })),
        Text("Seçili Öğrenci " + selectedStudent.firstName),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.blueAccent,
                child: Column(
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(
                      height: 3,
                    ),
                    Text("Yeni öğrenci"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StudentAdd(students))).then((value) => setState((){}));
                },
              ),
            ),
            SizedBox(
              width: 2,
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.greenAccent,
                child: Column(
                  children: <Widget>[
                    Icon(Icons.update),
                    SizedBox(
                      height: 3,
                    ),
                    Text("Güncelle"),
                  ],
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(
              width: 2,
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.redAccent,
                child: Column(
                  children: <Widget>[
                    Icon(Icons.delete),
                    SizedBox(
                      height: 3,
                    ),
                    Text("Sil"),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                  });
                  mesajGoster(context, "Silme işlemi", selectedStudent.firstName + " silindi");
                },
              ),
            )
          ],
        ),
        Row(
          children: <Widget>[],
        ),
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
