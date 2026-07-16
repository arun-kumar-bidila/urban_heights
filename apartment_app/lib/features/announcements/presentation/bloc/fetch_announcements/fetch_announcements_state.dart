part of 'fetch_announcements_bloc.dart';

sealed class FetchAnnouncementsState extends Equatable {
  const FetchAnnouncementsState();

  @override
  List<Object?> get props => [];
}

final class FetchAnnouncementsInitial extends FetchAnnouncementsState {}

final class FetchAnnouncementsLoading extends FetchAnnouncementsState {}

final class FetchAnnouncementsFailure extends FetchAnnouncementsState {
  final Failure failure;

  const FetchAnnouncementsFailure({required this.failure});
}

final class FetchAnnouncementsSuccess extends FetchAnnouncementsState {
  final List<AnnouncementEntity> announcements;

  const FetchAnnouncementsSuccess({required this.announcements});
}
