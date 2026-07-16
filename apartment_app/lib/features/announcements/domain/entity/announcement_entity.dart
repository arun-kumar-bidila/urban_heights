class AnnouncementEntity {
  final String title;
  final String description;
  final String datePosted;
  final bool pinned;

  final String apartmentId;

  AnnouncementEntity({
    required this.title,
    required this.description,
    required this.datePosted,
    required this.pinned,
    required this.apartmentId,
  });
}
