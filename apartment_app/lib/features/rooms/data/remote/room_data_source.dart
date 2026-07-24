import 'package:apartment_app/core/failure.dart';
import 'package:apartment_app/core/utils.dart';
import 'package:apartment_app/env/env.dart';
import 'package:apartment_app/features/rooms/data/model/room_model.dart';
import 'package:apartment_app/features/rooms/data/model/room_summary_model.dart';
import 'package:apartment_app/features/rooms/domain/use_case/add_room_use_case.dart';
import 'package:apartment_app/features/rooms/domain/use_case/add_tenant_use_case.dart';
import 'package:apartment_app/features/rooms/domain/use_case/remove_tenant_use_case.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class RoomDataSource {
  Future<Either<Failure, List<RoomModel>>> fetchRooms();

  Future<Either<Failure, bool>> addTenant({
    required AddTenantUseCaseParams params,
  });

  Future<Either<Failure, bool>> addRoom({required AddRoomUseCaseParams params});

  Future<Either<Failure, RoomSummaryModel>> fetchRoomSummary();

  Future<Either<Failure, bool>> removeTenant({
    required RemoveTenantUseCaseParams params,
  });
}

class RoomDataSourceImpl implements RoomDataSource {
  final Dio dio;
  final FlutterSecureStorage storage;

  RoomDataSourceImpl({required this.dio, required this.storage});
  @override
  Future<Either<Failure, List<RoomModel>>> fetchRooms() async {
    try {
      logger("${Env.baseUrl}${Env.fetchRooms}");

      String? token = await storage.read(key: "token");

      if (token == null || token.isEmpty) {
        return Left(Failure(message: "Authentication Failed. Log In Again"));
      }
      final response = await dio.get(
        Env.fetchRooms,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        List rooms = response.data["data"];
        return Right(rooms.map((room) => RoomModel.fromJson(room)).toList());
      } else {
        return Left(Failure());
      }
    } on DioException catch (e) {
      if (e.response == null) {
        return Left(Failure(message: "Internet error occurred"));
      }
      if ((e.response?.statusCode ?? 503) >= 500) {
        return Left(Failure(message: "Server Error occurred"));
      }
      String failureMessage =
          e.response?.data['message'] ?? 'Unknown error occurred';

      return Left(Failure(message: failureMessage));
    } catch (e) {
      logger(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, bool>> addTenant({
    required AddTenantUseCaseParams params,
  }) async {
    try {
      logger("${Env.baseUrl}${Env.addTenant}");

      String? token = await storage.read(key: "token");

      if (token == null || token.isEmpty) {
        return Left(Failure(message: "Authentication Failed. Log In Again"));
      }
      final response = await dio.post(
        Env.addTenant,
        options: Options(headers: {"Authorization": "Bearer $token"}),
        data: {
          "fullName": params.fullName,
          "mobile": "+91${params.mobile}",
          "email": params.email,
          "roomId": params.roomId,
          "roomType": params.roomType,
          "roomNumber": params.roomNumber,
          "apartmentName": params.apartmentName,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(true);
      } else {
        return Left(Failure());
      }
    } on DioException catch (e) {
      if (e.response == null) {
        return Left(Failure(message: "Internet error occurred"));
      }
      if ((e.response?.statusCode ?? 503) >= 500) {
        return Left(Failure(message: "Server Error occurred"));
      }
      String failureMessage =
          e.response?.data['message'] ?? 'Unknown error occurred';

      return Left(Failure(message: failureMessage));
    } catch (e) {
      logger(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, bool>> addRoom({
    required AddRoomUseCaseParams params,
  }) async {
    try {
      logger("${Env.baseUrl}${Env.addRoom}");

      String? token = await storage.read(key: "token");

      if (token == null || token.isEmpty) {
        return Left(Failure(message: "Authentication Failed. Log In Again"));
      }
      final response = await dio.post(
        Env.addRoom,
        options: Options(headers: {"Authorization": "Bearer $token"}),
        data: {
          "roomNumber": params.roomNumber,
          "rent": params.roomRent,
          "roomType": params.roomType,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(true);
      } else {
        return Left(Failure());
      }
    } on DioException catch (e) {
      if (e.response == null) {
        return Left(Failure(message: "Internet error occurred"));
      }
      if ((e.response?.statusCode ?? 503) >= 500) {
        return Left(Failure(message: "Server Error occurred"));
      }
      String failureMessage =
          e.response?.data['message'] ?? 'Unknown error occurred';

      return Left(Failure(message: failureMessage));
    } catch (e) {
      logger(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, RoomSummaryModel>> fetchRoomSummary() async {
    try {
      logger("${Env.baseUrl}${Env.roomSummary}");

      String? token = await storage.read(key: "token");

      if (token == null || token.isEmpty) {
        return Left(Failure(message: "Authentication Failed. Log In Again"));
      }
      final response = await dio.get(
        Env.roomSummary,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final summary = response.data["data"]["summary"];
        return Right(RoomSummaryModel.fromJson(summary));
      } else {
        return Left(Failure());
      }
    } on DioException catch (e) {
      if (e.response == null) {
        return Left(Failure(message: "Internet error occurred"));
      }
      if ((e.response?.statusCode ?? 503) >= 500) {
        return Left(Failure(message: "Server Error occurred"));
      }
      String failureMessage =
          e.response?.data['message'] ?? 'Unknown error occurred';

      return Left(Failure(message: failureMessage));
    } catch (e) {
      logger(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, bool>> removeTenant({
    required RemoveTenantUseCaseParams params,
  }) async {
    try {
      logger("${Env.baseUrl}${Env.removeTenant}");

      String? token = await storage.read(key: "token");

      if (token == null || token.isEmpty) {
        return Left(Failure(message: "Authentication Failed. Log In Again"));
      }
      final response = await dio.patch(
        Env.removeTenant,
        options: Options(headers: {"Authorization": "Bearer $token"}),
        data: {"tenantId": params.tenantId},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(true);
      } else {
        return Left(Failure());
      }
    } on DioException catch (e) {
      if (e.response == null) {
        return Left(Failure(message: "Internet error occurred"));
      }
      if ((e.response?.statusCode ?? 503) >= 500) {
        return Left(Failure(message: "Server Error occurred"));
      }
      String failureMessage =
          e.response?.data['message'] ?? 'Unknown error occurred';

      return Left(Failure(message: failureMessage));
    } catch (e) {
      logger(e.toString());
      return Left(Failure());
    }
  }
}
