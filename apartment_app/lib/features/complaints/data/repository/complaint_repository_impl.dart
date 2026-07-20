import 'package:apartment_app/core/failure.dart';
import 'package:apartment_app/features/complaints/data/remote/complaint_data_source.dart';
import 'package:apartment_app/features/complaints/domain/entity/complaint_entity.dart';
import 'package:apartment_app/features/complaints/domain/repository/complaint_repository.dart';
import 'package:fpdart/fpdart.dart';

class ComplaintRepositoryImpl implements ComplaintRepository {
  final ComplaintDataSource complaintDataSource;

  ComplaintRepositoryImpl({required this.complaintDataSource});
  @override
  Future<Either<Failure, List<ComplaintEntity>>> fetchComplaints() async {
    final result = await complaintDataSource.fetchComplaints();

    return result.fold((failure) => Left(failure), (success) => Right(success));
  }
}
