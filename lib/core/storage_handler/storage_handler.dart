import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class StorageHandler {
  StorageHandler._();

  static StorageHandler? _instance;

  factory StorageHandler() => _instance ??= StorageHandler._();

  final _storage = GetStorage('gold-shop');

  static Future<void> init() async {
    await GetStorage.init('gold-shop');
  }

  // Token
  Future<void> setToken(String token) => _storage.write('token', token);

  Future<void> removeToken() => _storage.remove('token');

  String get token => _storage.read('token') ?? 'no token';

  bool get hasToken => _storage.hasData('token');

  // role
  Future<void> setRole(String role) => _storage.write('role', role);

  Future<void> removeRole() => _storage.remove('role');

  String get role => _storage.read('role') ?? 'not authenticated';

  bool get hasRole => _storage.hasData('role');

}
