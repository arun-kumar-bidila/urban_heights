import 'package:admin_app/core/failure.dart';
import 'package:admin_app/features/apartment/data/remote/apartment_data_source.dart';
import 'package:admin_app/features/apartment/domain/entity/apartment_entity.dart';
import 'package:admin_app/features/apartment/domain/repository/apartment_repository.dart';
import 'package:admin_app/features/apartment/domain/use_case/add_apartment_use_case.dart';
import 'package:fpdart/fpdart.dart';

class ApartmentRepositoryImpl implements ApartmentRepository {
  final ApartmentDataSource apartmentDataSource;

  ApartmentRepositoryImpl({required this.apartmentDataSource});
  @override
  Future<Either<Failure, ApartmentEntity>> addApartment({
    required AddApartmentUseCaseParams params,
  }) async {
    final result = await apartmentDataSource.addApartment(params: params);

    return result.fold((failure) => Left(failure), (success) => Right(success));
  }

  @override
  Future<Either<Failure, List<ApartmentEntity>>> fetchAllApartments() async {
    final result = await apartmentDataSource.fetchAllApartments();

    return result.fold((failure) => Left(failure), (success) => Right(success));
  }
}
