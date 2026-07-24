import 'package:apartment_app/core/failure.dart';

import 'package:apartment_app/features/rooms/data/model/room_model.dart';
import 'package:apartment_app/features/rooms/domain/entity/room_summary_entity.dart';

import 'package:apartment_app/features/rooms/domain/use_case/add_room_use_case.dart';
import 'package:apartment_app/features/rooms/domain/use_case/add_tenant_use_case.dart';
import 'package:apartment_app/features/rooms/domain/use_case/remove_tenant_use_case.dart';

import 'package:fpdart/fpdart.dart';

abstract interface class RoomRepository {
  Future<Either<Failure, List<RoomModel>>> fetchRooms();
  Future<Either<Failure, bool>> addTenant({
    required AddTenantUseCaseParams params,
  });

  Future<Either<Failure, bool>> addRoom({required AddRoomUseCaseParams params});

  Future<Either<Failure, RoomSummaryEntity>> fetchRoomSummary();

  Future<Either<Failure, bool>> removeTenant({
    required RemoveTenantUseCaseParams params,
  });
}
