import 'package:apartment_app/core/failure.dart';
import 'package:apartment_app/features/rooms/data/model/room_model.dart';
import 'package:apartment_app/features/rooms/data/model/room_summary_model.dart';
import 'package:apartment_app/features/rooms/data/remote/room_data_source.dart';
import 'package:apartment_app/features/rooms/domain/repository/room_repository.dart';
import 'package:apartment_app/features/rooms/domain/use_case/add_room_use_case.dart';
import 'package:apartment_app/features/rooms/domain/use_case/add_tenant_use_case.dart';
import 'package:apartment_app/features/rooms/domain/use_case/remove_tenant_use_case.dart';
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

  @override
  Future<Either<Failure, bool>> addTenant({
    required AddTenantUseCaseParams params,
  }) async {
    final response = await roomDataSource.addTenant(params: params);

    return response.fold(
      (failure) => Left(failure),
      (success) => Right(success),
    );
  }

  @override
  Future<Either<Failure, bool>> addRoom({
    required AddRoomUseCaseParams params,
  }) async {
    final response = await roomDataSource.addRoom(params: params);

    return response.fold(
      (failure) => Left(failure),
      (success) => Right(success),
    );
  }

  @override
  Future<Either<Failure, RoomSummaryModel>> fetchRoomSummary() async {
    final response = await roomDataSource.fetchRoomSummary();

    return response.fold(
      (failure) => Left(failure),
      (success) => Right(success),
    );
  }

  @override
  Future<Either<Failure, bool>> removeTenant({
    required RemoveTenantUseCaseParams params,
  }) async {
    final response = await roomDataSource.removeTenant(params: params);

    return response.fold(
      (failure) => Left(failure),
      (success) => Right(success),
    );
  }
}
