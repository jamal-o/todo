// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/src/feat/auth/domain/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final useDataSource = false;

  return useDataSource
      ? AuthRepositoryDataSourceImpl(dataSource: RemoteDataSource())
      : AuthRepositoryImpl();
});

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<void> login(String email, String password) {
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}

class AuthRepositoryDataSourceImpl implements AuthRepository {
  final AuthRepositoryDataSource dataSource;
  AuthRepositoryDataSourceImpl({
    required this.dataSource,
  });
  @override
  Future<void> login(String email, String password) {
    return dataSource.login(email, password);
  }

  @override
  Future<void> logout() {
    return dataSource.logout();
  }
}

abstract class AuthRepositoryDataSource {
  Future<void> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  Future<void> logout() {
    // TODO: implement login
    throw UnimplementedError();
  }
}

class LocalDataSource implements AuthRepository {
  @override
  Future<void> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}

class RemoteDataSource implements AuthRepositoryDataSource {
  @override
  Future<void> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
