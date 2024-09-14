import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final SecureStorage _instance = SecureStorage._internal();
  late FlutterSecureStorage _storage;
  factory SecureStorage() {
    return _instance;
  }
  SecureStorage._internal() {
    _storage = const FlutterSecureStorage();
  }
  FlutterSecureStorage get storage => _storage;
}
