class ApartmentEntity {
  final String apartmentCode;
  final String apartmentName;
  final String ownerCode;
  final String address;
  final String ownerName;
  final String ownerMobile;
  final String password;
  final String createdAt;

  ApartmentEntity({
    required this.apartmentCode,
    required this.apartmentName,
    required this.ownerName,
    required this.ownerCode,
    required this.address,
    required this.password,
    required this.createdAt,
    required this.ownerMobile,
  });
}
