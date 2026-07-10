import 'package:admin_app/core/failure.dart';
import 'package:admin_app/core/utils.dart';
import 'package:admin_app/env/env.dart';
import 'package:admin_app/features/auth/data/model/admin_model.dart';
import 'package:admin_app/features/auth/domain/use_case/login_admin_use_case.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthDataSource {
  Future<Either<Failure, bool>> loginAdmin({
    required LoginAdminUseCaseParams params,
  });

  Future<Either<Failure, AdminModel>> fetchAdmin();
}

class AuthDataSourceImpl implements AuthDataSource {
  final Dio dio;
  final FlutterSecureStorage storage;
  AuthDataSourceImpl({required this.dio, required this.storage});

  @override
  Future<Either<Failure, bool>> loginAdmin({
    required LoginAdminUseCaseParams params,
  }) async {
    try {
      logger("${Env.baseUrl}${Env.loginAdmin}");
      final response = await dio.post(
        Env.loginAdmin,
        data: {"email": params.email, "password": params.password},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        logger(response.data["data"]["token"]);
        await storage.write(
          key: "token",
          value: response.data["data"]["token"],
        );
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
  Future<Either<Failure, AdminModel>> fetchAdmin() async {
    try {
      logger("${Env.baseUrl}${Env.fetchAdminProfile}");
      String? token = await storage.read(key: "token");

      if (token == null || token.isEmpty) {
        return Left(Failure(message: "Authentication Failed. Log In Again"));
      }

      final response = await dio.get(
        Env.fetchAdminProfile,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(AdminModel.fromJson(response.data["data"]));
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
