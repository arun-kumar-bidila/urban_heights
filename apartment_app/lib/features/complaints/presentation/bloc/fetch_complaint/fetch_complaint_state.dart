part of 'fetch_complaint_bloc.dart';

sealed class FetchComplaintState extends Equatable {
  const FetchComplaintState();

  @override
  List<Object?> get props => [];
}

final class FetchComplaintInitial extends FetchComplaintState {}

final class FetchComplaintLoading extends FetchComplaintState {}

final class FetchComplaintFailure extends FetchComplaintState {
  final Failure failure;

  const FetchComplaintFailure({required this.failure});
}

final class FetchComplaintSuccess extends FetchComplaintState {
  final List<ComplaintEntity> complaints;

  const FetchComplaintSuccess({required this.complaints});
}
