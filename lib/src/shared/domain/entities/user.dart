import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String username;
  final int followers;
  final int following;
  final String? imagePath;

  const UserEntity({
    required this.id,
    required this.username,
    this.followers = 0,
    this.following = 0,
    this.imagePath,
  });

  static empty() => const UserEntity(id: 'user_0', username: '-');

  @override
  List<Object?> get props => [
        id,
        username,
        followers,
        following,
        imagePath,
      ];
}
