part of 'delete_announcement_bloc.dart';

sealed class DeleteAnnouncementEvent extends Equatable {
  const DeleteAnnouncementEvent();

  @override
  List<Object?> get props => [];
}

final class DeleteAnnouncement extends DeleteAnnouncementEvent {
  final DeleteAnnouncementUseCaseParams deleteAnnouncementUseCaseParams;

  const DeleteAnnouncement({required this.deleteAnnouncementUseCaseParams});
}
