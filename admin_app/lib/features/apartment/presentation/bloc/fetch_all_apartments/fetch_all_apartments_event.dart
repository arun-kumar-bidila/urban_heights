part of 'fetch_all_apartments_bloc.dart';

sealed class FetchAllApartmentsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class FetchAllApartments extends FetchAllApartmentsEvent {}
