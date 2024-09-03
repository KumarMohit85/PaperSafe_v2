// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:paper_safe_v2/core/structs.dart';

class UserModel {
  String firstName;
  String lastName;
  int mobileNumber;
  String emailId;
  DateTime dob;
  Gender gender;
  String uniqueId;
  String id;
  UserModel({
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.emailId,
    required this.dob,
    required this.gender,
    required this.uniqueId,
    required this.id,
  });

  UserModel copyWith({
    String? firstName,
    String? lastName,
    int? mobileNumber,
    String? emailId,
    DateTime? dob,
    Gender? gender,
    String? uniqueId,
    String? id,
  }) {
    return UserModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      emailId: emailId ?? this.emailId,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      uniqueId: uniqueId ?? this.uniqueId,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'mobileNumber': mobileNumber,
      'emailId': emailId,
      'dob': dob.millisecondsSinceEpoch,
      'gender': gender.toMap(),
      'uniqueId': uniqueId,
      'id': id,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    print("from map fn called from user model");
    // return UserModel(
    //   firstName: map['firstName'] as String,
    //   lastName: map['lastName'] as String,
    //   mobileNumber: map['mobileNumber'] as int,
    //   emailId: map['emailId'] as String,
    //   dob: DateTime.fromMillisecondsSinceEpoch(map['dob'] as int),
    //   gender: GenderExtension.fromMap(map['gender'] as String),
    //   uniqueId: map['uniqueID'] as String,
    //   id: map['_id'] as String,
    // );
    return UserModel(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      mobileNumber: map['mobileNumber'] as int,
      emailId: map['emailID'] as String, // Corrected key
      dob: DateTime.parse(map['dob'] as String), // Parse ISO 8601 date string
      gender: GenderExtension.fromMap(map['gender']
          as String), // Assuming you have a method to convert String to Gender enum
      uniqueId: map['uniqueID'] as String,
      id: map['_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(firstName: $firstName, lastName: $lastName, mobileNumber: $mobileNumber, emailId: $emailId, dob: $dob, gender: $gender, uniqueId: $uniqueId, _id: $id)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.firstName == firstName &&
        other.lastName == lastName &&
        other.mobileNumber == mobileNumber &&
        other.emailId == emailId &&
        other.dob == dob &&
        other.gender == gender &&
        other.uniqueId == uniqueId &&
        other.id == id;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        mobileNumber.hashCode ^
        emailId.hashCode ^
        dob.hashCode ^
        gender.hashCode ^
        uniqueId.hashCode ^
        id.hashCode;
  }
}
