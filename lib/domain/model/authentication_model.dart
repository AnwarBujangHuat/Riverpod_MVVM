import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_model.freezed.dart';
part 'authentication_model.g.dart';

@freezed
class Authentication with _$Authentication {
  factory Authentication({
    int? status,
    String? message,
    required Customer? customer,
    required Contacts? contacts,
  }) = _Authentication;

  factory Authentication.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationFromJson(json);
}

@freezed
class Customer with _$Customer {
  factory Customer({
    required String id,
    required String name,
    required int numOfNotifications,
  }) = _Customer;

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
}

@freezed
class Contacts with _$Contacts {
  factory Contacts({
    required String email,
    required String phone,
    required String link,
  }) = _Contacts;

  factory Contacts.fromJson(Map<String, dynamic> json) =>
      _$ContactsFromJson(json);
}

@freezed
class BaseResponse with _$BaseResponse {
  factory BaseResponse({
    int? status,
    String? message,
  }) = _BaseResponse;

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);
}
