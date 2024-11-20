class WomenVisitModel {
  final int id;

  final String currentStatus;

  final String statusType;

  final dynamic weight;

  final String date;

  WomenVisitModel(
      {required this.id,
      required this.currentStatus,
      required this.statusType,
      required this.weight,
      required this.date});

  factory WomenVisitModel.fromJson({required Map<String, dynamic> json}) {
    return WomenVisitModel(
      id: json['id'],
      currentStatus: json['current_status'],
      statusType: json['status_type'],
      weight: json['weight'],
      date: json['date'],
    );
  }
}
class ChildVisitModel {
  final int id;

  final String currentStatus;

  final dynamic weight;

  final dynamic height;
  final dynamic zScore;
  final dynamic muac;

  final String date;

  ChildVisitModel(
      {required this.id,
      required this.currentStatus,
      required this.height,
      required this.weight,
      required this.zScore,
      required this.muac,
      required this.date});

  factory ChildVisitModel.fromJson({required Map<String, dynamic> json}) {
    return ChildVisitModel(
      id: json['id'],
      currentStatus: json['current_status'],
      height: json['height'],
      weight: json['weight'],
      zScore: json['z_score'],
      muac: json['muac'],
      date: json['date'],
    );
  }
}
