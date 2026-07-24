import 'package:apartment_app/core/failure.dart';
import 'package:apartment_app/core/use_case.dart';
import 'package:apartment_app/features/rooms/domain/repository/room_repository.dart';
import 'package:fpdart/fpdart.dart';

class RemoveTenantUseCase implements UseCase<bool, RemoveTenantUseCaseParams> {
  final RoomRepository roomRepository;

  RemoveTenantUseCase({required this.roomRepository});
  @override
  Future<Either<Failure, bool>> call(RemoveTenantUseCaseParams params) async {
    return await roomRepository.removeTenant(params: params);
  }
}

class RemoveTenantUseCaseParams {
  final String tenantId;

  RemoveTenantUseCaseParams({required this.tenantId});
}
