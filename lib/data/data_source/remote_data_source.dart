// ignore_for_file: prefer_final_fields

import 'package:mobile_flutter_template/data/network/app_api.dart';
import 'package:mobile_flutter_template/data/request/request.dart';
import 'package:mobile_flutter_template/domain/model/authentication_model.dart';

abstract class RemoteDataSource {
  Future<Authentication> login(LoginRequest loginRequest);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  AppServiceClient _appServiceClient;

  RemoteDataSourceImplementer(this._appServiceClient);

  @override
  Future<Authentication> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.email, loginRequest.password, "abc", "android");
  }
}
