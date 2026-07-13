import 'package:apartment_app/core/failure.dart';
import 'package:apartment_app/core/use_case.dart';
import 'package:apartment_app/features/auth/domain/entity/apartment_entity.dart';
import 'package:apartment_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class FetchApartmentUseCase implements UseCase<ApartmentEntity, NoParams> {
  final AuthRepository authRepository;

  FetchApartmentUseCase({required this.authRepository});
  @override
  Future<Either<Failure, ApartmentEntity>> call(NoParams params) async {
    return await authRepository.fetchApartment();
  }
}
