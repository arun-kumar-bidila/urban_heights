import 'package:apartment_app/core/failure.dart';

import 'package:apartment_app/features/rooms/data/model/room_model.dart';

import 'package:fpdart/fpdart.dart';

abstract interface class RoomRepository {
  Future<Either<Failure, List<RoomModel>>> fetchRooms();
}
