import 'package:apartment_app/features/complaints/domain/entity/complaint_entity.dart';

class ComplaintModel extends ComplaintEntity {
  ComplaintModel({
    required super.id,
    required super.title,
    required super.description,
    required super.roomNumber,
    required super.status,
    required super.tenantName,
    required super.tenantMobile,
    required super.createdAt,
  });

  factory ComplaintModel.fromJson(Map<String, dynamic> json) => ComplaintModel(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    roomNumber: json["roomNumber"],
    status: json["status"],
    tenantName: json["tenantName"],
    tenantMobile: json["tenantMobile"],
    createdAt: json["createdAt"],
  );
}
