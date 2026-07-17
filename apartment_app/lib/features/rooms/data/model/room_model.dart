import 'package:apartment_app/features/rooms/domain/entity/room_entity.dart';

class RoomModel extends RoomEntity {
  RoomModel({
    required super.roomId,
    required super.roomNumber,
    required super.roomType,
    required super.rent,
    required super.apartmentId,
    required super.vacant,
  });

  factory RoomModel.fromJson(Map<String, dynamic> json) => RoomModel(
    roomId: json["roomId"] ?? "",
    roomNumber: json["roomNumber"] ?? "",
    roomType: json["roomType"] ?? "",
    rent: json["rent"] ?? 0,
    apartmentId: json["apartmentId"] ?? "",
    vacant: json["vacant"] ?? true,
  );
}
