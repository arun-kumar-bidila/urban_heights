import 'package:apartment_app/features/announcements/presentation/bloc/fetch_announcements/fetch_announcements_bloc.dart';
import 'package:apartment_app/features/auth/presentation/bloc/fetch_apartment/fetch_apartment_bloc.dart';
import 'package:apartment_app/features/auth/presentation/bloc/login_apartment/login_apartment_bloc.dart';
import 'package:get_it/get_it.dart';

Future<void> initBlocService({required GetIt sl}) async {
  /* ***************************  APARTMENT ************************/
  sl.registerFactory<LoginApartmentBloc>(
    () => LoginApartmentBloc(loginApartmentUseCase: sl()),
  );
  sl.registerFactory<FetchApartmentBloc>(
    () => FetchApartmentBloc(fetchAdminUseCase: sl()),
  );
  // /* ***************************  APARTMENT ************************/
  sl.registerFactory<FetchAnnouncementsBloc>(
    () => FetchAnnouncementsBloc(fetchAnnouncementsUseCase: sl()),
  );
  // sl.registerFactory<DashboardSummaryBloc>(
  //   () => DashboardSummaryBloc(dashboardSummaryUseCase: sl()),
  // );
  // sl.registerFactory<FetchAllApartmentsBloc>(
  //   () => FetchAllApartmentsBloc(fetchAllApartmentsUseCase: sl()),
  // );
}
