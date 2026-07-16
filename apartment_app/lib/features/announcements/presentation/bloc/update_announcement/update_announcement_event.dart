part of 'update_announcement_bloc.dart';

sealed class UpdateAnnouncementEvent extends Equatable {
  const UpdateAnnouncementEvent();

  @override
  List<Object?> get props => [];
}

final class UpdateAnnouncement extends UpdateAnnouncementEvent {
  final UpdateAnnouncementUseCaseParams params;
  const UpdateAnnouncement({required this.params});
}
