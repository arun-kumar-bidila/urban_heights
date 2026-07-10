import 'package:admin_app/core/failure.dart';
import 'package:admin_app/features/auth/data/model/admin_model.dart';
import 'package:admin_app/features/auth/data/remote/auth_data_source.dart';
import 'package:admin_app/features/auth/domain/repository/auth_repository.dart';
import 'package:admin_app/features/auth/domain/use_case/login_admin_use_case.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl({required this.authDataSource});
  @override
  Future<Either<Failure, bool>> loginAdmin({
    required LoginAdminUseCaseParams params,
  }) async {
    final result = await authDataSource.loginAdmin(params: params);

    return result.fold((failure) => Left(failure), (success) => Right(success));
  }

  @override
  Future<Either<Failure, AdminModel>> fetchAdmin() async {
    final result = await authDataSource.fetchAdmin();

    return result.fold((failure) => Left(failure), (success) => Right(success));
  }
}
