import 'package:mobile_flutter_template/data/request/request.dart';
import 'package:mobile_flutter_template/domain/state/login_state.dart';

abstract class Repository {
  Future<LoginState> login(LoginRequest loginRequest);
}
