import 'package:admin_app/core/failure.dart';
import 'package:admin_app/core/use_case.dart';
import 'package:admin_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class LoginAdminUseCase implements UseCase<bool, LoginAdminUseCaseParams> {
  final AuthRepository authRepository;

  LoginAdminUseCase({required this.authRepository});
  @override
  Future<Either<Failure, bool>> call(LoginAdminUseCaseParams params) async {
    return await authRepository.loginAdmin(params: params);
  }
}

class LoginAdminUseCaseParams {
  final String email;
  final String password;
  LoginAdminUseCaseParams({required this.email, required this.password});
}
