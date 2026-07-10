part of 'add_apartment_bloc.dart';

sealed class AddApartmentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class AddApartment extends AddApartmentEvent {
  final AddApartmentUseCaseParams params;

  AddApartment({required this.params});
}
