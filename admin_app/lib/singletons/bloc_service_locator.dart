import 'package:admin_app/features/apartment/presentation/bloc/add_apartment/add_apartment_bloc.dart';
import 'package:admin_app/features/apartment/presentation/bloc/fetch_all_apartments/fetch_all_apartments_bloc.dart';
import 'package:admin_app/features/auth/presentation/bloc/fetch_admin/fetch_admin_bloc.dart';
import 'package:admin_app/features/auth/presentation/bloc/login_admin/login_admin_bloc.dart';
import 'package:admin_app/features/dashboard/presentation/bloc/dashboard_summary/dashboard_summary_bloc.dart';
import 'package:get_it/get_it.dart';

Future<void> initBlocService({required GetIt sl}) async {
  /* ***************************  ADMIN ************************/
  sl.registerFactory<LoginAdminBloc>(
    () => LoginAdminBloc(loginAdminUseCase: sl()),
  );
  sl.registerFactory<FetchAdminBloc>(
    () => FetchAdminBloc(fetchAdminUseCase: sl()),
  );
  /* ***************************  APARTMENT ************************/
  sl.registerFactory<AddApartmentBloc>(
    () => AddApartmentBloc(addApartmentUseCase: sl()),
  );
  sl.registerFactory<DashboardSummaryBloc>(
    () => DashboardSummaryBloc(dashboardSummaryUseCase: sl()),
  );
  sl.registerFactory<FetchAllApartmentsBloc>(
    () => FetchAllApartmentsBloc(fetchAllApartmentsUseCase: sl()),
  );
}
