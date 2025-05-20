import 'package:get_it/get_it.dart';
// import 'package:simplify_vms/utils/networks/end_point.dart';
import 'networks/app_interceptor.dart';
import 'networks/network_service.dart';

GetIt getIt = GetIt.instance;
void initDependencyLocator() {
  getIt
    // ..registerLazySingleton<AppInterceptor>(() => AppInterceptor(EndPoint.appBaseUrl))
    ..registerLazySingleton<NetworkService>(() => NetworkService());
}
