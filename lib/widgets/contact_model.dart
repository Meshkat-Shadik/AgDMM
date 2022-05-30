// To parse this JSON data, do
//
//     final contact = contactFromJson(jsonString);



class Contact {
  Contact({
    this.name,
    this.desig,
    this.faculty,
    this.vname,
    this.bName,
    this.email,
    this.img,
    this.phone,
  });

  String? name;
  String? desig;
  String? faculty;
  String? vname;
  String? bName;
  String? email;
  String? img;
  String? phone;
}
