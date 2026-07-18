import 'package:apartment_app/core/failure.dart';
import 'package:apartment_app/core/use_case.dart';
import 'package:apartment_app/features/rooms/domain/entity/room_summary_entity.dart';
import 'package:apartment_app/features/rooms/domain/repository/room_repository.dart';
import 'package:fpdart/fpdart.dart';

class FetchRoomSummaryUseCase implements UseCase<RoomSummaryEntity, NoParams> {
  final RoomRepository roomRepository;

  FetchRoomSummaryUseCase({required this.roomRepository});
  @override
  Future<Either<Failure, RoomSummaryEntity>> call(NoParams params) async {
    return await roomRepository.fetchRoomSummary();
  }
}
