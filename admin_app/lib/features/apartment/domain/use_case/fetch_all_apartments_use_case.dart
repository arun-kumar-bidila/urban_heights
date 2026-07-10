import 'package:admin_app/core/failure.dart';
import 'package:admin_app/core/use_case.dart';
import 'package:admin_app/features/apartment/domain/entity/apartment_entity.dart';
import 'package:admin_app/features/apartment/domain/repository/apartment_repository.dart';
import 'package:fpdart/fpdart.dart';

class FetchAllApartmentsUseCase
    implements UseCase<List<ApartmentEntity>, NoParams> {
  final ApartmentRepository apartmentRepository;

  FetchAllApartmentsUseCase({required this.apartmentRepository});
  @override
  Future<Either<Failure, List<ApartmentEntity>>> call(NoParams params) async {
    return await apartmentRepository.fetchAllApartments();
  }
}
