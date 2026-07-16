import 'package:apartment_app/core/failure.dart';
import 'package:apartment_app/features/announcements/data/remote/announcement_data_source.dart';
import 'package:apartment_app/features/announcements/domain/entity/announcement_entity.dart';
import 'package:apartment_app/features/announcements/domain/repository/announcement_repository.dart';
import 'package:fpdart/fpdart.dart';

class AnnouncementRepositoryImpl implements AnnouncementRepository {
  final AnnouncementDataSource announcementDataSource;

  AnnouncementRepositoryImpl({required this.announcementDataSource});
  @override
  Future<Either<Failure, bool>> deleteAnnouncement({
    required String announcementId,
  }) async {
    final result = await announcementDataSource.deleteAnnouncement(
      announcementId: announcementId,
    );

    return result.fold((failure) => Left(failure), (success) => Right(success));
  }

  @override
  Future<Either<Failure, List<AnnouncementEntity>>> fetchAnnouncement() async {
    final result = await announcementDataSource.fetchAnnouncement();

    return result.fold((failure) => Left(failure), (success) => Right(success));
  }

  @override
  Future<Either<Failure, bool>> updateAnnouncement({
    required String announcementId,
    required bool pinned,
  }) async {
    final result = await announcementDataSource.updateAnnouncement(
      announcementId: announcementId,
      pinned: pinned,
    );

    return result.fold((failure) => Left(failure), (success) => Right(success));
  }
}
