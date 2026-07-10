import 'package:admin_app/core/failure.dart';
import 'package:admin_app/core/use_case.dart';
import 'package:admin_app/features/apartment/domain/entity/apartment_entity.dart';
import 'package:admin_app/features/apartment/domain/repository/apartment_repository.dart';
import 'package:fpdart/fpdart.dart';

class AddApartmentUseCase
    implements UseCase<ApartmentEntity, AddApartmentUseCaseParams> {
  final ApartmentRepository apartmentRepository;

  AddApartmentUseCase({required this.apartmentRepository});
  @override
  Future<Either<Failure, ApartmentEntity>> call(
    AddApartmentUseCaseParams params,
  ) async {
    return await apartmentRepository.addApartment(params: params);
  }
}

class AddApartmentUseCaseParams {
  final String apartmentName;
  final String ownerCode;
  final String address;
  final String ownerName;
  final String ownerMobile;
  final String password;

  AddApartmentUseCaseParams({
    required this.apartmentName,
    required this.ownerName,
    required this.ownerCode,
    required this.address,
    required this.password,

    required this.ownerMobile,
  });
}
