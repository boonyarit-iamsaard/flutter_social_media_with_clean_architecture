/// This file contains the implementation of a mock authentication data source
/// for a Flutter application. It includes classes and methods to manage user
/// authentication, registration, login, and logout.

import 'dart:async';

import 'package:flutter_social_media_with_clean_architecture/src/features/auth/domain/entities/authenticated_user_entity.dart';
import 'package:flutter_social_media_with_clean_architecture/src/shared/domain/entities/user_entity.dart';

/// An enumeration representing the authentication status.
enum AuthenticationStatus {
  unknown, // Authentication status is unknown.
  authenticated, // User is authenticated.
  unauthenticated, // User is not authenticated.
}

/// An abstract class defining the contract for a mock authentication data source.
abstract class MockAuthDataSource {
  /// A stream that emits the authentication status.
  Stream<AuthenticationStatus> get authenticationStatus;

  /// A future that retrieves the authenticated user entity.
  Future<AuthenticatedUserEntity> get authenticatedUser;

  /// Registers a new user.
  Future<void> register({required AuthenticatedUserEntity user});

  /// Logs a user in.
  Future<void> login({
    required Username username,
    required Password password,
  });

  /// Logs a user out.
  Future<void> logout();
}

/// A concrete implementation of the [MockAuthDataSource] interface.
class MockAuthDataSourceImpl implements MockAuthDataSource {
  MockAuthDataSourceImpl({required CacheClient cache}) : _cache = cache;

  final _controller = StreamController<AuthenticationStatus>();
  final CacheClient _cache;

  static const authenticatedUserCacheKey = 'authenticated_user_cache_key';

  @override
  Stream<AuthenticationStatus> get authenticationStatus async* {
    await Future<void>.delayed(
      const Duration(seconds: 1),
    );
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  @override
  Future<AuthenticatedUserEntity> get authenticatedUser {
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        return _cache.read<AuthenticatedUserEntity>(
                key: authenticatedUserCacheKey) ??
            AuthenticatedUserEntity.empty;
      },
    );
  }

  @override
  Future<void> login({
    required Username username,
    required Password password,
  }) {
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        for (final user in _mockUsers) {
          if (user.username.value == username.value) {
            _updateAuthenticatedUser(
              id: user.id,
              username: user.username,
            );
            _controller.add(AuthenticationStatus.authenticated);
            return;
          }
        }

        throw LoginException.fromCode('user-not-found');
      },
    );
  }

  @override
  Future<void> logout() {
    return Future.delayed(const Duration(seconds: 1), () {
      _cache.write<AuthenticatedUserEntity>(
        key: authenticatedUserCacheKey,
        value: AuthenticatedUserEntity.empty,
      );
      _controller.add(AuthenticationStatus.unauthenticated);
    });
  }

  @override
  Future<void> register({required AuthenticatedUserEntity user}) {
    return Future.delayed(const Duration(seconds: 1), () {
      _mockUsers.add(user);
      _updateAuthenticatedUser(
        id: user.id,
        username: user.username,
        email: user.email,
      );
      _controller.add(AuthenticationStatus.unauthenticated);
    });
  }

  void _updateAuthenticatedUser({
    String? id,
    Username? username,
    Email? email,
  }) {
    AuthenticatedUserEntity user = _cache.read<AuthenticatedUserEntity>(
          key: authenticatedUserCacheKey,
        ) ??
        AuthenticatedUserEntity.empty;

    _cache.write(
      key: authenticatedUserCacheKey,
      value: user.copyWith(
        id: id,
        username: username,
        email: email,
      ),
    );
  }

  final List<UserEntity> _mockUsers = [
    const UserEntity(
      id: 'user_1',
      username: Username.dirty('Massimo'),
      imagePath: 'assets/images/image_1.jpg',
    ),
    const UserEntity(
      id: 'user_2',
      username: Username.dirty('Sarah'),
      imagePath: 'assets/images/image_2.jpg',
    ),
    const UserEntity(
      id: 'user_3',
      username: Username.dirty('John'),
      imagePath: 'assets/images/image_3.jpg',
    ),
  ];
}

class LoginException implements Exception {
  const LoginException(this.message);

  final String message;

  factory LoginException.fromCode(String code) {
    switch (code) {
      case 'user-not-found':
        return const LoginException('User not found, please register.');
      case 'invalid-credentials':
        return const LoginException('Invalid username or password.');
      default:
        return const LoginException('An unknown error occurred.');
    }
  }
}

/// A simple cache client for storing key-value pairs.
class CacheClient {
  CacheClient() : _cache = <String, Object>{};

  final Map<String, Object> _cache;

  /// Writes a value to the cache with the specified key.
  void write<T extends Object>({required String key, required T value}) {
    _cache[key] = value;
  }

  /// Reads a value from the cache using the specified key.
  T? read<T extends Object>({required String key}) {
    final value = _cache[key];

    if (value is T) {
      return value;
    }

    return null;
  }
}
