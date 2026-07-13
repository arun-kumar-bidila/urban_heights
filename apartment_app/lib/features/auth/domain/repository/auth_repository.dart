import 'package:apartment_app/core/failure.dart';
import 'package:apartment_app/features/auth/domain/entity/apartment_entity.dart';
import 'package:apartment_app/features/auth/domain/use_case/login_apartment_use_case.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, bool>> loginApartment({
    required LoginApartmentUseCaseParams params,
  });
  Future<Either<Failure, ApartmentEntity>> fetchApartment();
}
