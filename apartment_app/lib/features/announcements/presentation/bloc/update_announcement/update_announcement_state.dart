part of 'update_announcement_bloc.dart';

sealed class UpdateAnnouncementState extends Equatable {
  const UpdateAnnouncementState();

  @override
  List<Object?> get props => [];
}

final class UpdateAnnouncementInitial extends UpdateAnnouncementState {}

final class UpdateAnnouncementLoading extends UpdateAnnouncementState {}

final class UpdateAnnouncementFailure extends UpdateAnnouncementState {
  final Failure failure;

  const UpdateAnnouncementFailure({required this.failure});
}

final class UpdateAnnouncementSuccess extends UpdateAnnouncementState {}
