import 'package:admin_app/core/failure.dart';
import 'package:admin_app/core/use_case.dart';
import 'package:admin_app/features/auth/domain/entity/admin_entity.dart';
import 'package:admin_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class FetchAdminUseCase implements UseCase<AdminEntity, NoParams> {
  final AuthRepository authRepository;

  FetchAdminUseCase({required this.authRepository});
  @override
  Future<Either<Failure, AdminEntity>> call(NoParams params) async {
    return await authRepository.fetchAdmin();
  }
}
