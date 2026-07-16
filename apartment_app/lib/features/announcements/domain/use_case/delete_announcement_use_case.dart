import 'package:apartment_app/core/failure.dart';
import 'package:apartment_app/core/use_case.dart';
import 'package:apartment_app/features/announcements/domain/repository/announcement_repository.dart';
import 'package:fpdart/fpdart.dart';

class DeleteAnnouncementUseCase
    implements UseCase<bool, DeleteAnnouncementUseCaseParams> {
  final AnnouncementRepository announcementRepository;

  DeleteAnnouncementUseCase({required this.announcementRepository});
  @override
  Future<Either<Failure, bool>> call(
    DeleteAnnouncementUseCaseParams params,
  ) async {
    return await announcementRepository.deleteAnnouncement(
      announcementId: params.announcementId,
    );
  }
}

class DeleteAnnouncementUseCaseParams {
  final String announcementId;
  DeleteAnnouncementUseCaseParams({required this.announcementId});
}
