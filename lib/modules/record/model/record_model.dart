class RecordDetailsModel {
  final int id;

  final String name;

  final String fatherName;
  final String motherName;
  final String lastName;
  final String fullName;
  final String gender;
  final String phoneNumber;
  final String age;
  final String address;
  final int specialNeeds;

  RecordDetailsModel({
    required this.id,
    required this.fullName,
    required this.gender,
    required this.phoneNumber,
    required this.age,
    required this.address,
    required this.specialNeeds,
    required this.lastName,
    required this.name,
    required this.fatherName,
    required this.motherName,
  });

  factory RecordDetailsModel.fromJson({required Map<String, dynamic> json}) {
    return RecordDetailsModel(
      id: json['id'],
      fullName: json['full_name'],
      gender: json['gender'],
      phoneNumber: json['phone_number'],
      age: json['age'],
      address: json['address_name'],
      specialNeeds: json['special_needs'],
      lastName: json['last_name'],
      name: json['name'],
      fatherName: json['father_name'],
      motherName: json['mother_name'],
    );
  }
}

class VisitsDetailsModel {
  final int id;
  final int medicalRecordId;
  final String result;
  String? activity;
  final String date;

  VisitsDetailsModel({
    required this.id,
    required this.medicalRecordId,
    required this.result,
    this.activity,
    required this.date,
  });

  factory VisitsDetailsModel.fromJson({required Map<String, dynamic> json}) {
    return VisitsDetailsModel(
      id: json['id'],
      medicalRecordId: json['medical_record_id'],
      result: json['result'],
      activity: json['activity']??'لا يوجد نشاط',
      date: json['date'],
    );
  }
}
