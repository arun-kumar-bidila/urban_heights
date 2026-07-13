import 'package:apartment_app/core/failure.dart';
import 'package:apartment_app/core/use_case.dart';
import 'package:apartment_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class LoginApartmentUseCase
    implements UseCase<bool, LoginApartmentUseCaseParams> {
  final AuthRepository authRepository;

  LoginApartmentUseCase({required this.authRepository});
  @override
  Future<Either<Failure, bool>> call(LoginApartmentUseCaseParams params) async {
    return await authRepository.loginApartment(params: params);
  }
}

class LoginApartmentUseCaseParams {
  final String apartmentCode;
  final String password;
  LoginApartmentUseCaseParams({
    required this.apartmentCode,
    required this.password,
  });
}
