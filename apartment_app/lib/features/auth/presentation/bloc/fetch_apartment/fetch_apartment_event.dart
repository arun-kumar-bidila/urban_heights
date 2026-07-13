part of 'fetch_apartment_bloc.dart';

sealed class FetchApartmentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class FetchApartment extends FetchApartmentEvent {}

final class ResetAdminBlocEvent extends FetchApartmentEvent {}
