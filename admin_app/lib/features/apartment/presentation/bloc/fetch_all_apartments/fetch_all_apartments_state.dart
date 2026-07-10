part of 'fetch_all_apartments_bloc.dart';

sealed class FetchAllApartmentsState extends Equatable {
  @override
  List<Object> get props => [];
}

final class FetchAllApartmentsInitial extends FetchAllApartmentsState {}

final class FetchAllApartmentsLoading extends FetchAllApartmentsState {}

final class FetchAllApartmentsFailure extends FetchAllApartmentsState {
  final Failure failure;

  FetchAllApartmentsFailure({required this.failure});
}

final class FetchAllApartmentsSuccess extends FetchAllApartmentsState {
  final List<ApartmentEntity> allApartments;

  FetchAllApartmentsSuccess({required this.allApartments});
}
