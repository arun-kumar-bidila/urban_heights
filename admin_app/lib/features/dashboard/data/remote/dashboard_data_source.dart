import 'package:admin_app/core/failure.dart';
import 'package:admin_app/core/utils.dart';
import 'package:admin_app/env/env.dart';
import 'package:admin_app/features/dashboard/data/model/summary_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class DashboardDataSource {
  Future<Either<Failure, SummaryModel>> fetchSummary();
}

class DashboardDataSourceImpl implements DashboardDataSource {
  final Dio dio;
  final FlutterSecureStorage storage;

  DashboardDataSourceImpl({required this.dio, required this.storage});
  @override
  Future<Either<Failure, SummaryModel>> fetchSummary() async {
    try {
      logger("${Env.baseUrl}${Env.fetchSummary}");
      String? token = await storage.read(key: "token");

      if (token == null || token.isEmpty) {
        return Left(Failure(message: "Authentication Failed. Log In Again"));
      }

      final response = await dio.get(
        Env.fetchSummary,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(SummaryModel.fromJson(response.data["data"]));
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
