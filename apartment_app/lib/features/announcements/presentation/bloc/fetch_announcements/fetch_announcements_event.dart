part of 'fetch_announcements_bloc.dart';

sealed class FetchAnnouncementsEvent extends Equatable {
  const FetchAnnouncementsEvent();

  @override
  List<Object?> get props => [];
}

final class FetchAnnouncements extends FetchAnnouncementsEvent {}
