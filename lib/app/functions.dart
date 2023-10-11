import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:mobile_flutter_template/domain/model/model.dart';

Future<DeviceInfo> getDeviceDetails() async {
  String name = "UNKNOWN";
  String identifier = "UNKNOWN";
  String version = "UNKNOWN";

  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  try {
    if (Platform.isAndroid) {
      // return android device info
      var build = await deviceInfoPlugin.androidInfo;
      name = "${build.brand} ${build.model}";
      identifier = build.id ?? "UNKNOWN";
      version = build.version.codename!;
    } else if (Platform.isIOS) {
      // return ios device info
      var build = await deviceInfoPlugin.iosInfo;
      name = "${build.name} ${build.model}";
      identifier = build.identifierForVendor ?? "UNKNOWN";
      version = build.systemVersion ?? "UNKNOWN";
    }
  } on PlatformException {
    // return default data here
    return DeviceInfo(name, identifier, version);
  }
  return DeviceInfo(name, identifier, version);
}

bool isEmailValid(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}
