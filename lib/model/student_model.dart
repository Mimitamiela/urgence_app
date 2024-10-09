class StudentModel {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? parentPhoneNumber;
  String? diseases;
  String? bloodType;
  String? email;

  StudentModel(
      {this.firstName,
      this.lastName,
      this.phoneNumber,
      this.parentPhoneNumber,
      this.diseases,
      this.bloodType,
      this.email});

  StudentModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    parentPhoneNumber = json['parentPhoneNumber'];
    diseases = json['diseases'];
    bloodType = json['bloodType'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phoneNumber'] = phoneNumber;
    data['parentPhoneNumber'] = parentPhoneNumber;
    data['diseases'] = diseases;
    data['bloodType'] = bloodType;
    data['email'] = email;
    return data;
  }
}
