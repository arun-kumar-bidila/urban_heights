import 'package:apartment_app/core/failure.dart';
import 'package:apartment_app/core/utils.dart';
import 'package:apartment_app/env/env.dart';
import 'package:apartment_app/features/announcements/data/model/announcement_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AnnouncementDataSource {
  Future<Either<Failure, List<AnnouncementModel>>> fetchAnnouncement();

  Future<Either<Failure, bool>> deleteAnnouncement({
    required String announcementId,
  });

  Future<Either<Failure, bool>> updateAnnouncement({
    required String announcementId,
    required bool pinned,
  });
}

class AnnouncementDataSourceImpl implements AnnouncementDataSource {
  final Dio dio;
  final FlutterSecureStorage storage;

  AnnouncementDataSourceImpl({required this.dio, required this.storage});

  @override
  Future<Either<Failure, bool>> deleteAnnouncement({
    required String announcementId,
  }) async {
    try {
      logger("${Env.baseUrl}${Env.deleteAnnouncement}$announcementId");

      String? token = await storage.read(key: "token");

      if (token == null || token.isEmpty) {
        return Left(Failure(message: "Authentication Failed. Log In Again"));
      }
      final response = await dio.delete(
        "${Env.deleteAnnouncement}$announcementId",
        options: Options(headers: {"Authorization": "Bearer $token"}),
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
  Future<Either<Failure, List<AnnouncementModel>>> fetchAnnouncement() async {
    try {
      logger("${Env.baseUrl}${Env.fetchAnnouncement}");

      String? token = await storage.read(key: "token");

      if (token == null || token.isEmpty) {
        return Left(Failure(message: "Authentication Failed. Log In Again"));
      }
      final response = await dio.get(
        Env.fetchAnnouncement,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        List announcements = response.data["data"];
        return Right(
          announcements
              .map((announcement) => AnnouncementModel.fromJson(announcement))
              .toList(),
        );
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
  Future<Either<Failure, bool>> updateAnnouncement({
    required String announcementId,
    required bool pinned,
  }) async {
    try {
      logger("${Env.baseUrl}${Env.updateAnnouncement}$announcementId");
      String? token = await storage.read(key: "token");

      if (token == null || token.isEmpty) {
        return Left(Failure(message: "Authentication Failed. Log In Again"));
      }
      final response = await dio.patch(
        "${Env.updateAnnouncement}$announcementId",
        options: Options(headers: {"Authorization": "Bearer $token"}),
        data: {"pinned": pinned},
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
