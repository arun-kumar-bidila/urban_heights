import 'package:apartment_app/core/failure.dart';
import 'package:apartment_app/core/use_case.dart';
import 'package:apartment_app/features/rooms/domain/repository/room_repository.dart';
import 'package:fpdart/fpdart.dart';

class AddTenantUseCase implements UseCase<bool, AddTenantUseCaseParams> {
  final RoomRepository roomRepository;

  AddTenantUseCase({required this.roomRepository});
  @override
  Future<Either<Failure, bool>> call(AddTenantUseCaseParams params) async {
    return await roomRepository.addTenant(params: params);
  }
}

class AddTenantUseCaseParams {
  final String fullName;
  final String mobile;
  final String email;
  final String roomId;

  AddTenantUseCaseParams({
    required this.fullName,
    required this.mobile,
    required this.email,
    required this.roomId,
  });
}
