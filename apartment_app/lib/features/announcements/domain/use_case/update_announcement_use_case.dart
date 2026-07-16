import 'package:apartment_app/core/failure.dart';
import 'package:apartment_app/core/use_case.dart';
import 'package:apartment_app/features/announcements/domain/repository/announcement_repository.dart';
import 'package:fpdart/fpdart.dart';

class UpdateAnnouncementUseCase
    implements UseCase<bool, UpdateAnnouncementUseCaseParams> {
  final AnnouncementRepository announcementRepository;
  UpdateAnnouncementUseCase({required this.announcementRepository});
  @override
  Future<Either<Failure, bool>> call(
    UpdateAnnouncementUseCaseParams params,
  ) async {
    return await announcementRepository.updateAnnouncement(
      announcementId: params.announcementId,
      pinned: params.pinned,
    );
  }
}

class UpdateAnnouncementUseCaseParams {
  final String announcementId;
  final bool pinned;
  UpdateAnnouncementUseCaseParams({
    required this.announcementId,
    required this.pinned,
  });
}
