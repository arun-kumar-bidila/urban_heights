class RoomEntity {
  final String roomId;
  final String roomNumber;
  final String roomType;
  final int rent;
  final String apartmentId;
  final bool vacant;

  RoomEntity({
    required this.roomId,
    required this.roomNumber,
    required this.roomType,
    required this.rent,
    required this.apartmentId,
    required this.vacant,
  });
}
