import 'package:apartment_app/core/failure.dart';
import 'package:apartment_app/core/use_case.dart';
import 'package:apartment_app/features/rooms/domain/entity/room_entity.dart';
import 'package:apartment_app/features/rooms/domain/repository/room_repository.dart';
import 'package:fpdart/fpdart.dart';

class FetchRoomsUseCase implements UseCase<List<RoomEntity>, NoParams> {
  final RoomRepository roomRepository;

  FetchRoomsUseCase({required this.roomRepository});
  @override
  Future<Either<Failure, List<RoomEntity>>> call(NoParams params) async {
    return await roomRepository.fetchRooms();
  }
}
