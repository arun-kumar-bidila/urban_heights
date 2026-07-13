import 'package:apartment_app/features/auth/domain/entity/apartment_entity.dart';

class ApartmentModel extends ApartmentEntity {
  ApartmentModel({
    required super.apartmentCode,
    required super.apartmentName,
    required super.address,
    required super.ownerName,
    required super.ownerMobile,
    required super.ownerCode,
  });

  factory ApartmentModel.fromJson(Map<String, dynamic> json) => ApartmentModel(
    apartmentCode: json["apartmentCode"],
    apartmentName: json["apartmentName"],
    address: json["address"],
    ownerName: json["ownerName"],
    ownerMobile: json["ownerMobile"],
    ownerCode: json["ownerCode"],
  );
}
