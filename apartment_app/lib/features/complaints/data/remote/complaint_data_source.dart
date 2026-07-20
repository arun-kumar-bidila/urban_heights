import 'package:apartment_app/core/failure.dart';
import 'package:apartment_app/core/utils.dart';
import 'package:apartment_app/env/env.dart';
import 'package:apartment_app/features/complaints/data/model/complaint_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ComplaintDataSource {
  Future<Either<Failure, List<ComplaintModel>>> fetchComplaints();
}

class ComplaintDataSourceImpl implements ComplaintDataSource {
  final Dio dio;
  final FlutterSecureStorage storage;

  ComplaintDataSourceImpl({required this.dio, required this.storage});
  @override
  Future<Either<Failure, List<ComplaintModel>>> fetchComplaints() async {
    try {
      logger("${Env.baseUrl}${Env.fetchComplaints}");

      String? token = await storage.read(key: "token");

      if (token == null || token.isEmpty) {
        return Left(Failure(message: "Authentication Failed. Log In Again"));
      }
      final response = await dio.get(
        Env.fetchComplaints,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        List complaints = response.data["data"];
        return Right(
          complaints
              .map((complaint) => ComplaintModel.fromJson(complaint))
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
}
