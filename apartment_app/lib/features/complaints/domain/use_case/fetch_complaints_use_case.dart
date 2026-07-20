import 'package:apartment_app/core/failure.dart';
import 'package:apartment_app/core/use_case.dart';
import 'package:apartment_app/features/complaints/domain/entity/complaint_entity.dart';
import 'package:apartment_app/features/complaints/domain/repository/complaint_repository.dart';
import 'package:fpdart/fpdart.dart';

class FetchComplaintsUseCase
    implements UseCase<List<ComplaintEntity>, NoParams> {
  final ComplaintRepository complaintRepository;

  FetchComplaintsUseCase({required this.complaintRepository});
  @override
  Future<Either<Failure, List<ComplaintEntity>>> call(NoParams params) async {
    return await complaintRepository.fetchComplaints();
  }
}
