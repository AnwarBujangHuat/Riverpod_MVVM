import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_flutter_template/data/network/failure.dart';
import 'package:mobile_flutter_template/domain/model/authentication_model.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState.loading() = _Loading;
  const factory LoginState.initial(String username) = _Initial;
  const factory LoginState.success(Authentication authentication) = _Success;
  const factory LoginState.error(Failure appException) = _Error;
}
