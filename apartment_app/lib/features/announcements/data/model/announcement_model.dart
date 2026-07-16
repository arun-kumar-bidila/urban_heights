import 'package:apartment_app/features/announcements/domain/entity/announcement_entity.dart';

class AnnouncementModel extends AnnouncementEntity {
  AnnouncementModel({
    required super.title,
    required super.description,
    required super.datePosted,
    required super.pinned,
    required super.apartmentId,
  });

  factory AnnouncementModel.fromJson(Map<String, dynamic> json) =>
      AnnouncementModel(
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        datePosted: json["datePosted"] ?? "",
        pinned: json["pinned"] ?? false,
        apartmentId: json["apartmentId"] ?? "",
      );
}
