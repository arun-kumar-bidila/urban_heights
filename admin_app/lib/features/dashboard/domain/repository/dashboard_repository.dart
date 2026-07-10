import 'package:admin_app/core/failure.dart';
import 'package:admin_app/features/dashboard/domain/entity/summary_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class DashboardRepository {
  Future<Either<Failure, SummaryEntity>> fetchSummary();
}
