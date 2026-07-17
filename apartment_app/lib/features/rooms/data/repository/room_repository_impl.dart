import 'package:apartment_app/core/failure.dart';
import 'package:apartment_app/features/rooms/data/model/room_model.dart';
import 'package:apartment_app/features/rooms/data/remote/room_data_source.dart';
import 'package:apartment_app/features/rooms/domain/repository/room_repository.dart';
import 'package:fpdart/fpdart.dart';

class RoomRepositoryImpl implements RoomRepository {
  final RoomDataSource roomDataSource;

  RoomRepositoryImpl({required this.roomDataSource});
  @override
  Future<Either<Failure, List<RoomModel>>> fetchRooms() async {
    final response = await roomDataSource.fetchRooms();

    return response.fold(
      (failure) => Left(failure),
      (success) => Right(success),
    );
  }
}
