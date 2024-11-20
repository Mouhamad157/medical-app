class HomeScreenModel {
  final int id;
  final int medicalRecordId;
  final String fullName;
  final String gender;

  final int age;

  HomeScreenModel(
      {required this.id,
        required this.medicalRecordId,
      required this.fullName,
      required this.gender,
      required this.age});

  factory HomeScreenModel.fromJson({required Map<String, dynamic> json}) {
    return HomeScreenModel(
      id: json['id'],
      medicalRecordId: json['medical_record_id'],
      fullName: json['fullName'],
      gender: json['gender'],
      age: json['age'],
    );
  }
}
