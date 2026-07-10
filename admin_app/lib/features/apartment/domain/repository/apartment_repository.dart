import 'package:admin_app/core/failure.dart';
import 'package:admin_app/features/apartment/domain/entity/apartment_entity.dart';
import 'package:admin_app/features/apartment/domain/use_case/add_apartment_use_case.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ApartmentRepository {
  Future<Either<Failure, ApartmentEntity>> addApartment({
    required AddApartmentUseCaseParams params,
  });

  Future<Either<Failure, List<ApartmentEntity>>> fetchAllApartments();
}
