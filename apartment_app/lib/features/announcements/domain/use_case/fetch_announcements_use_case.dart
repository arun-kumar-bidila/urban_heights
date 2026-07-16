import 'package:apartment_app/core/failure.dart';
import 'package:apartment_app/core/use_case.dart';
import 'package:apartment_app/features/announcements/domain/entity/announcement_entity.dart';
import 'package:apartment_app/features/announcements/domain/repository/announcement_repository.dart';
import 'package:fpdart/fpdart.dart';

class FetchAnnouncementsUseCase
    implements UseCase<List<AnnouncementEntity>, NoParams> {
  final AnnouncementRepository announcementRepository;
  FetchAnnouncementsUseCase({required this.announcementRepository});
  @override
  Future<Either<Failure, List<AnnouncementEntity>>> call(
    NoParams params,
  ) async {
    return await announcementRepository.fetchAnnouncement();
  }
}
