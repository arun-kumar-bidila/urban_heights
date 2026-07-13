import 'package:apartment_app/core/failure.dart';
import 'package:apartment_app/features/auth/data/model/apartment_model.dart';
import 'package:apartment_app/features/auth/data/remote/auth_data_source.dart';
import 'package:apartment_app/features/auth/domain/repository/auth_repository.dart';
import 'package:apartment_app/features/auth/domain/use_case/login_apartment_use_case.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl({required this.authDataSource});
  @override
  Future<Either<Failure, bool>> loginApartment({
    required LoginApartmentUseCaseParams params,
  }) async {
    final result = await authDataSource.loginApartment(params: params);

    return result.fold((failure) => Left(failure), (success) => Right(success));
  }

  @override
  Future<Either<Failure, ApartmentModel>> fetchApartment() async {
    final result = await authDataSource.fetchApartment();

    return result.fold((failure) => Left(failure), (success) => Right(success));
  }
}
