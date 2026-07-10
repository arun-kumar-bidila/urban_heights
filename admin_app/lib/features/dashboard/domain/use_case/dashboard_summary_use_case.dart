import 'package:admin_app/core/failure.dart';
import 'package:admin_app/core/use_case.dart';
import 'package:admin_app/features/dashboard/domain/entity/summary_entity.dart';
import 'package:admin_app/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:fpdart/fpdart.dart';

class DashboardSummaryUseCase implements UseCase<SummaryEntity, NoParams> {
  final DashboardRepository dashboardRepository;

  DashboardSummaryUseCase({required this.dashboardRepository});
  @override
  Future<Either<Failure, SummaryEntity>> call(NoParams params) async {
    return await dashboardRepository.fetchSummary();
  }
}
