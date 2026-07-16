import 'package:apartment_app/core/failure.dart';
import 'package:apartment_app/features/announcements/domain/entity/announcement_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AnnouncementRepository {
  Future<Either<Failure, List<AnnouncementEntity>>> fetchAnnouncement();

  Future<Either<Failure, bool>> deleteAnnouncement({
    required String announcementId,
  });

  Future<Either<Failure, bool>> updateAnnouncement({
    required String announcementId,
    required bool pinned,
  });
}
