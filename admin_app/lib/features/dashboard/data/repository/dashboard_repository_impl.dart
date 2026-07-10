import 'package:admin_app/core/failure.dart';
import 'package:admin_app/features/dashboard/data/remote/dashboard_data_source.dart';
import 'package:admin_app/features/dashboard/domain/entity/summary_entity.dart';
import 'package:admin_app/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:fpdart/fpdart.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardDataSource dashboardDataSource;

  DashboardRepositoryImpl({required this.dashboardDataSource});
  @override
  Future<Either<Failure, SummaryEntity>> fetchSummary() async {
    final result = await dashboardDataSource.fetchSummary();

    return result.fold((failure) => Left(failure), (success) => Right(success));
  }
}
