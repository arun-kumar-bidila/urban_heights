import 'package:admin_app/features/apartment/domain/entity/apartment_entity.dart';

class ApartmentModel extends ApartmentEntity {
  ApartmentModel({
    required super.apartmentCode,
    required super.apartmentName,
    required super.ownerName,
    required super.ownerCode,
    required super.address,
    required super.password,
    required super.createdAt,
    required super.ownerMobile,
  });

  factory ApartmentModel.fromJson(Map<String, dynamic> json) => ApartmentModel(
    apartmentCode: json["apartmentCode"] ?? "",
    apartmentName: json["apartmentName"] ?? "",
    ownerName: json["ownerName"] ?? "",
    ownerCode: json["ownerCode"] ?? "",
    address: json["address"] ?? "",
    password: json["password"] ?? "",
    createdAt: json["password"] ?? "",
    ownerMobile: json["ownerMobile"] ?? "",
  );
}
