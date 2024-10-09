import 'package:cloud_firestore/cloud_firestore.dart';

class StudentModel {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? parentPhoneNumber;
  String? diseases;
  String? bloodType;
  String? email;
  String? dateOfBirth;
  String? gender;
  String? imageUrl;
  DateTime? createdAt;

  StudentModel({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.parentPhoneNumber,
    this.diseases,
    this.bloodType,
    this.email,
    this.dateOfBirth,
    this.gender,
    this.imageUrl,
    this.createdAt,
  });

  StudentModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    parentPhoneNumber = json['parentPhoneNumber'];
    diseases = json['diseases'];
    bloodType = json['bloodType'];
    email = json['email'];
    dateOfBirth = json['dateOfBirth'];
    gender = json['gender'];
    imageUrl = json['imageUrl'];
    createdAt = (json['createdAt'] as Timestamp?)?.toDate();
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
    data['dateOfBirth'] = dateOfBirth;
    data['gender'] = gender;
    data['imageUrl'] = imageUrl;
    data['createdAt'] = createdAt;
    return data;
  }
}
