part of 'delete_announcement_bloc.dart';

sealed class DeleteAnnouncementState extends Equatable {
  const DeleteAnnouncementState();

  @override
  List<Object?> get props => [];
}

final class DeleteAnnouncementInitial extends DeleteAnnouncementState {}

final class DeleteAnnouncementLoading extends DeleteAnnouncementState {}

final class DeleteAnnouncementFailure extends DeleteAnnouncementState {
  final Failure failure;
  const DeleteAnnouncementFailure({required this.failure});
}

final class DeleteAnnouncementSuccess extends DeleteAnnouncementState {}
