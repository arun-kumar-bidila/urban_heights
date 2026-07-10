part of 'add_apartment_bloc.dart';

sealed class AddApartmentState extends Equatable {
  @override
  List<Object> get props => [];
}

final class AddApartmentInitial extends AddApartmentState {}

final class AddApartmentLoading extends AddApartmentState {}

final class AddApartmentFailure extends AddApartmentState {
  final Failure failure;

  AddApartmentFailure({required this.failure});
}

final class AddApartmentSuccess extends AddApartmentState {
  final ApartmentEntity apartmentEntity;

  AddApartmentSuccess({required this.apartmentEntity});
}
