class StudentValidationMixin{
  String ValidateFirstName( String value){
    if(value.length<3){
      return "Ad en az 3 karakter olmalıdır";
    }
  }
  String ValidateLastName( String value){
    if(value.length<3){
      return "Soyad en az 3 karakter olmalıdır";
    }
  }
  String ValidateGradeName( String value){
    var grade=int.parse(value);
    if(grade<0 || grade>100){
      return "Öğrenci notu 0-100 arasında olmalıdır";
    }
  }
}