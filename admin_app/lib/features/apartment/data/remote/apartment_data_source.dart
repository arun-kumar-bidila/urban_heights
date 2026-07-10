import 'package:admin_app/core/failure.dart';
import 'package:admin_app/core/utils.dart';
import 'package:admin_app/env/env.dart';
import 'package:admin_app/features/apartment/data/model/apartment_model.dart';
import 'package:admin_app/features/apartment/domain/entity/apartment_entity.dart';
import 'package:admin_app/features/apartment/domain/use_case/add_apartment_use_case.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ApartmentDataSource {
  Future<Either<Failure, ApartmentEntity>> addApartment({
    required AddApartmentUseCaseParams params,
  });

  Future<Either<Failure, List<ApartmentEntity>>> fetchAllApartments();
}

class ApartmentDataSourceImpl implements ApartmentDataSource {
  final Dio dio;
  final FlutterSecureStorage storage;
  ApartmentDataSourceImpl({required this.dio, required this.storage});

  @override
  Future<Either<Failure, ApartmentEntity>> addApartment({
    required AddApartmentUseCaseParams params,
  }) async {
    try {
      logger("${Env.baseUrl}${Env.createApartment}");
      String? token = await storage.read(key: "token");

      if (token == null || token.isEmpty) {
        return Left(Failure(message: "Authentication Failed. Log In Again"));
      }

      final response = await dio.post(
        Env.createApartment,
        options: Options(headers: {"Authorization": "Bearer $token"}),
        data: {
          "apartmentName": params.apartmentName,
          "address": params.address,
          "ownerName": params.ownerName,
          "ownerMobile": params.ownerMobile,
          "ownerCode": params.ownerCode,
          "password": params.password,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(ApartmentModel.fromJson(response.data["data"]));
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
  Future<Either<Failure, List<ApartmentModel>>> fetchAllApartments() async {
    try {
      logger("${Env.baseUrl}${Env.fetchAllApartments}");
      String? token = await storage.read(key: "token");

      if (token == null || token.isEmpty) {
        return Left(Failure(message: "Authentication Failed. Log In Again"));
      }

      final response = await dio.get(
        Env.fetchAllApartments,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        List data = response.data["data"]["apartments"];
        return Right(data.map((e) => ApartmentModel.fromJson(e)).toList());
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
