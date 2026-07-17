import 'package:apartment_app/features/rooms/domain/entity/room_entity.dart';

class RoomModel extends RoomEntity {
  RoomModel({
    required super.roomId,
    required super.roomNumber,
    required super.roomType,
    required super.rent,
    required super.apartmentId,
    required super.vacant,
    required super.rentStatus,
    super.tenant,
  });

  factory RoomModel.fromJson(Map<String, dynamic> json) => RoomModel(
    roomId: json["roomId"] ?? "",
    roomNumber: json["roomNumber"] ?? "",
    roomType: json["roomType"] ?? "",
    rent: json["rent"] ?? 0,
    rentStatus: json["rentStatus"] ?? false,
    apartmentId: json["apartmentId"] ?? "",
    vacant: json["vacant"] ?? true,
    tenant: json["tenant"] == null
        ? null
        : TenantModel.fromJson(json["tenant"]),
  );
}

class TenantModel extends TenantEntity {
  TenantModel({
    required super.tenantId,
    required super.fullName,
    required super.mobile,
    required super.email,
    required super.createdAt,
  });

  factory TenantModel.fromJson(Map<String, dynamic> json) => TenantModel(
    tenantId: json["tenantId"] ?? "",
    fullName: json["fullName"] ?? "",
    mobile: json["mobile"] ?? "",
    email: json["email"] ?? "",
    createdAt: json["createdAt"] ?? "",
  );
}
