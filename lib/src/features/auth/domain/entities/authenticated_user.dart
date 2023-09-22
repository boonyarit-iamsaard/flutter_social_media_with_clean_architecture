import 'package:flutter_social_media_with_clean_architecture/src/shared/domain/entities/user.dart';

class AuthenticatedUserEntity extends UserEntity {
  const AuthenticatedUserEntity({
    required super.id,
    required super.username,
    super.followers,
    super.following,
    super.imagePath,
    this.email,
  });

  final String? email;

  static empty() => const AuthenticatedUserEntity(
        id: 'user_0',
        username: '-',
        email: '-',
      );

  @override
  List<Object?> get props => [
        id,
        username,
        followers,
        following,
        imagePath,
        email,
      ];

  AuthenticatedUserEntity copyWith({
    String? id,
    String? username,
    int? followers,
    int? following,
    String? imagePath,
    String? email,
  }) {
    return AuthenticatedUserEntity(
      id: id ?? this.id,
      username: username ?? this.username,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      imagePath: imagePath ?? this.imagePath,
      email: email ?? this.email,
    );
  }
}
