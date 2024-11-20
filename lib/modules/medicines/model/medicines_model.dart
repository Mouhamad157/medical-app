class MedicinesModel {
  final int orderId;

  final int medicineId;

  final int medicalCenterId;

  final int quantity;

  final String type;

  final String scientificName;

  final dynamic unit;

  final dynamic titer;

  final String name;

  MedicinesModel(
      {required this.orderId,
      required this.medicineId,
      required this.medicalCenterId,
      required this.quantity,
      required this.type,
      required this.scientificName,
      required this.unit,
      required this.titer,
      required this.name});

  factory MedicinesModel.fromJson({required Map<String, dynamic> json}) {
    return MedicinesModel(
      orderId: json['id'],
      medicineId: json['medicine_id'],
      medicalCenterId: json['medical_center_id'],
      quantity: json['quantity'],
      type: json['medicine']['type'],
      scientificName: json['medicine']['scientific_name'],
      unit: json['medicine']['unit'],
      titer: json['medicine']['titer'],
      name: json['medicine']['name'],
    );
  }
}
