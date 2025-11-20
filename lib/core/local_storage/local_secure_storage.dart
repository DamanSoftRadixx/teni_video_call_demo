import 'dart:convert' show jsonEncode, jsonDecode;

import 'package:teni_video_call_demo/di.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:teni_video_call_demo/feature/login/domain/entities/user.dart'
    show RefreshTokenDetail;

class LocalSecureStorage {
  // Singleton pattern
  static final LocalSecureStorage _instance = LocalSecureStorage._internal();
  factory LocalSecureStorage() => _instance;
  LocalSecureStorage._internal();

  static const String tokenKey = 'token';
  static const String refreshTokenKey = 'refreshToken';
  static const String joinVideoCallDetailKey = 'joinVideoCallDetail';

  // save RefreshTokenDetail to shared preferences
  Future<void> clearRefreshTokenDetail(
  ) async {
    await getIt<FlutterSecureStorage>().delete(key: joinVideoCallDetailKey);
  }
  Future<void> saveRefreshTokenDetail(
    RefreshTokenDetail refreshTokenDetail,
  ) async {
    await getIt<FlutterSecureStorage>().write(
      key: joinVideoCallDetailKey,
      value: jsonEncode(refreshTokenDetail.toJson()),
    );
  }

  Future<RefreshTokenDetail?> getRefreshTokenDetail() async {
    final value = await getIt<FlutterSecureStorage>().read(
      key: joinVideoCallDetailKey,
    );
    if (value == null) {
      return null;
    }
    return RefreshTokenDetail.fromJson(jsonDecode(value));
  }

  // Read value
  Future<String?> getToken() async {
    return await getIt<FlutterSecureStorage>().read(key: tokenKey);
  }

  // Write value
  Future<void> write({required String key, required String value}) async {
    await getIt<FlutterSecureStorage>().write(key: key, value: value);
  }

  // Read value
  Future<String?> read({required String key}) async {
    return await getIt<FlutterSecureStorage>().read(key: key);
  }

  // Read all values
  Future<Map<String, String>> readAll() async {
    return await getIt<FlutterSecureStorage>().readAll();
  }

  // Delete value
  Future<void> delete({required String key}) async {
    await getIt<FlutterSecureStorage>().delete(key: key);
  }

  // Delete all values
  Future<void> deleteAll() async {
    await getIt<FlutterSecureStorage>().deleteAll();
  }
}
