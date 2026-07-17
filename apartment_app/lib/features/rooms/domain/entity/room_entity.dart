class RoomEntity {
  final String roomId;
  final String roomNumber;
  final String roomType;
  final int rent;
  final bool rentStatus;
  final String apartmentId;
  final bool vacant;
  final TenantEntity? tenant;

  RoomEntity({
    required this.roomId,
    required this.roomNumber,
    required this.roomType,
    required this.rent,
    required this.apartmentId,
    required this.vacant,
    required this.rentStatus,
    this.tenant,
  });
}

class TenantEntity {
  final String tenantId;
  final String fullName;
  final String mobile;
  final String email;
  final String createdAt;

  TenantEntity({
    required this.tenantId,
    required this.fullName,
    required this.mobile,
    required this.email,
    required this.createdAt,
  });
}
