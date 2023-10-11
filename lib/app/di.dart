// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:mobile_flutter_template/data/data_source/local_data_source.dart';
// import 'package:mobile_flutter_template/data/data_source/remote_data_source.dart';
// import 'package:mobile_flutter_template/data/network/app_api.dart';
// import 'package:mobile_flutter_template/data/network/dio_factory.dart';
// import 'package:mobile_flutter_template/data/network/network_info.dart';
// import 'package:mobile_flutter_template/data/repository/repository_impl.dart';
// import 'package:mobile_flutter_template/domain/repository/repository.dart';
// import 'package:mobile_flutter_template/presentation/login/login_viewmodel.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:get_it/get_it.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'app_prefs.dart';

// final sharedPreferencesProvider =
//     FutureProvider<SharedPreferences>((ref) async {
//   return await SharedPreferences.getInstance();
// });

// final networkInfoProvider = Provider<NetworkInfo>((ref) {
//   return NetworkInfoImpl(InternetConnectionChecker());
// });

// final dioFactoryProvider = Provider<DioFactory>((ref) {
//   return DioFactory();
// });

// final appServiceClientProvider = Provider<AppServiceClient>((ref) {
//   final dioFactory = ref.watch(dioFactoryProvider);
//   dioFactory.getDio().then((value) {
//     return AppServiceClient(value);
//   });
  
// });
// final remoteDataSourceProvider = Provider<RemoteDataSource>((ref) {
//   final appServiceClient = ref.watch(appServiceClientProvider);
//   return RemoteDataSourceImplementer(appServiceClient);
// });

// final localDataSourceProvider = Provider<LocalDataSource>((ref) {
//   return LocalDataSourceImplementer();
// });

// final repositoryProvider = Provider<Repository>((ref) {
//   final networkInfo = ref.watch(networkInfoProvider);
//   final remoteDataSource = ref.watch(remoteDataSourceProvider);
//   final localDataSource = ref.watch(localDataSourceProvider);
//   return RepositoryImpl(
//       networkInfo: networkInfo,
//       remoteDataSource: remoteDataSource,
//       localDataSource: localDataSource);
// });
