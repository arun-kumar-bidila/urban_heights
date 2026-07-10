import 'package:admin_app/core/utils.dart';
import 'package:admin_app/env/env.dart';
import 'package:admin_app/singletons/bloc_service_locator.dart';
import 'package:admin_app/singletons/data_source_service_locator.dart';
import 'package:admin_app/singletons/repository_service_locator.dart';
import 'package:admin_app/singletons/use_case_service_locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
void initDependencies() async {
  try {
    /* ***************************  FEATURED ************************/
    await initDataSources(sl: sl);
    await initRepository(sl: sl);
    await initUseCase(sl: sl);
    await initBlocService(sl: sl);

    /* ***************************  CORE ************************/
    final dio = Dio(
      BaseOptions(
        baseUrl: Env.baseUrl,
        headers: {"Content-Type": "application/json"},
      ),
    );

    final storage = FlutterSecureStorage();

    sl.registerLazySingleton<Dio>(() => dio);
    sl.registerLazySingleton<FlutterSecureStorage>(() => storage);
  } catch (e) {
    logger(e.toString());
  }
}
