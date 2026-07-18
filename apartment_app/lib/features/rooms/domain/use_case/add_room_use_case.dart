import 'package:apartment_app/core/failure.dart';
import 'package:apartment_app/core/use_case.dart';
import 'package:apartment_app/features/rooms/domain/repository/room_repository.dart';
import 'package:fpdart/fpdart.dart';

class AddRoomUseCase implements UseCase<bool, AddRoomUseCaseParams> {
  final RoomRepository roomRepository;

  AddRoomUseCase({required this.roomRepository});
  @override
  Future<Either<Failure, bool>> call(AddRoomUseCaseParams params) async {
    return await roomRepository.addRoom(params: params);
  }
}

class AddRoomUseCaseParams {
  final String roomNumber;
  final String roomType;
  final int roomRent;

  AddRoomUseCaseParams({
    required this.roomNumber,
    required this.roomType,
    required this.roomRent,
  });
}
