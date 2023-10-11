import 'package:mobile_flutter_template/app/constant.dart';
import 'package:dio/dio.dart';
import 'package:mobile_flutter_template/domain/model/authentication_model.dart';
// ignore: depend_on_referenced_packages
import 'package:retrofit/http.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/customers/login")
  Future<Authentication> login(
    @Field("email") String email,
    @Field("password") String password,
    @Field("imei") String imei,
    @Field("deviceType") String deviceType,
  );
}
