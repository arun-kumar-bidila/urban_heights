part of 'fetch_apartment_bloc.dart';

sealed class FetchApartmentState extends Equatable {
  @override
  List<Object> get props => [];
}

final class FetchApartmentInitial extends FetchApartmentState {}

final class FetchApartmentLoading extends FetchApartmentState {}

final class FetchApartmentFailure extends FetchApartmentState {
  final Failure failure;
  FetchApartmentFailure({required this.failure});
}

final class FetchApartmentSuccess extends FetchApartmentState {
  final ApartmentEntity adminEntity;

  FetchApartmentSuccess({required this.adminEntity});
}
