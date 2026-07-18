import 'package:apartment_app/features/rooms/domain/entity/room_summary_entity.dart';

class RoomSummaryModel extends RoomSummaryEntity {
  RoomSummaryModel({
    required super.totalRooms,
    required super.vacantRooms,
    required super.occupiedRooms,
  });

  factory RoomSummaryModel.fromJson(Map<String, dynamic> json) =>
      RoomSummaryModel(
        totalRooms: json["totalRooms"] ?? 0,
        vacantRooms: json["vacantRooms"] ?? 0,
        occupiedRooms: json["occupiedRooms"] ?? 0,
      );
}
