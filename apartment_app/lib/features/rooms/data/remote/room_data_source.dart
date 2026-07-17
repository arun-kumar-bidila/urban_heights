import 'package:apartment_app/core/failure.dart';
import 'package:apartment_app/core/utils.dart';
import 'package:apartment_app/env/env.dart';
import 'package:apartment_app/features/rooms/data/model/room_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class RoomDataSource {
  Future<Either<Failure, List<RoomModel>>> fetchRooms();
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
}
