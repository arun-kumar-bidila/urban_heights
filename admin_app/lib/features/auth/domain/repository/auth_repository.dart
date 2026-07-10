import 'package:admin_app/core/failure.dart';
import 'package:admin_app/features/auth/data/model/admin_model.dart';
import 'package:admin_app/features/auth/domain/use_case/login_admin_use_case.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, bool>> loginAdmin({
    required LoginAdminUseCaseParams params,
  });
  Future<Either<Failure, AdminModel>> fetchAdmin();
}
