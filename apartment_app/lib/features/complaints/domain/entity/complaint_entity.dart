class ComplaintEntity {
  final String id;
  final String title;
  final String description;
  final String roomNumber;
  final String status;
  final String tenantName;
  final String tenantMobile;
  final String createdAt;

  ComplaintEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.roomNumber,
    required this.status,
    required this.tenantName,
    required this.tenantMobile,
    required this.createdAt,
  });
}
