part of 'fetch_complaint_bloc.dart';

sealed class FetchComplaintEvent extends Equatable {
  const FetchComplaintEvent();

  @override
  List<Object?> get props => [];
}

final class FetchComplaint extends FetchComplaintEvent {}
