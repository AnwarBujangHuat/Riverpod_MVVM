// ignore_for_file: avoid_print

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobile_flutter_template/data/data_source/local_data_source.dart';
import 'package:mobile_flutter_template/data/data_source/remote_data_source.dart';
import 'package:mobile_flutter_template/data/network/app_api.dart';
import 'package:mobile_flutter_template/data/network/dio_factory.dart';
import 'package:mobile_flutter_template/data/network/error_handler.dart';
import 'package:mobile_flutter_template/data/network/failure.dart';
import 'package:mobile_flutter_template/data/network/network_info.dart';
import 'package:mobile_flutter_template/data/request/request.dart';
import 'package:mobile_flutter_template/domain/model/authentication_model.dart';
import 'package:mobile_flutter_template/domain/repository/repository.dart';
import 'package:mobile_flutter_template/domain/state/login_state.dart';

final repositoryProvider = Provider<Repository>((ref) {
  return RepositoryImpl(ref);
});

class RepositoryImpl extends Repository {
  RepositoryImpl(this.ref);
  final Ref ref;

  @override
  Future<LoginState> login(LoginRequest loginRequest) async {
    final dio = await DioFactory().getDio();
    final RemoteDataSource remoteDataSource =
        RemoteDataSourceImplementer(AppServiceClient(dio));
    final NetworkInfo networkInfo =
        NetworkInfoImpl(InternetConnectionChecker());
    if (await networkInfo.isConnected) {
      try {
        // its safe to call the API
        Authentication response = await remoteDataSource.login(loginRequest);

        if (response.status == ApiInternalStatus.SUCCESS) // success
        {
          return LoginState.success(response);
        } else {
          return LoginState.error(Failure(409,
              response.message ?? "we have biz error logic from API side"));
        }
      } catch (error) {
        return (LoginState.error(ErrorHandler.handle(error).failure));
      }
    } else {
      // return connection error
      return LoginState.error(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
