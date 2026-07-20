import 'package:apartment_app/core/failure.dart';
import 'package:apartment_app/features/complaints/domain/entity/complaint_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ComplaintRepository {
  Future<Either<Failure, List<ComplaintEntity>>> fetchComplaints();
}
