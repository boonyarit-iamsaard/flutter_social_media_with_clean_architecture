import 'package:flutter_social_media_with_clean_architecture/src/shared/domain/entities/user_entity.dart';

/// Represents a user model used in your Flutter application.
class UserModel {
  /// The unique identifier for the user.
  final String id;

  /// The username of the user.
  final String username;

  /// The number of followers for the user (default is 0).
  final int followers;

  /// The number of users the user is following (default is 0).
  final int following;

  /// The optional path to the user's image.
  final String? imagePath;

  /// Creates an instance of [UserModel].
  ///
  /// The [id] and [username] parameters are required.
  /// The [followers] and [following] parameters have default values of 0.
  const UserModel({
    required this.id,
    required this.username,
    this.followers = 0,
    this.following = 0,
    this.imagePath,
  });

  /// Creates a [UserModel] instance from a JSON map.
  ///
  /// This factory method is used to deserialize a JSON map into a [UserModel] object.
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      followers: json['followers'],
      following: json['following'],
      imagePath: json['imagePath'],
    );
  }

  /// Creates a [UserModel] instance from a [UserEntity] instance.
  ///
  /// This factory method is used to convert a [UserEntity] object into a [UserModel] object.
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      username: entity.username.value,
      followers: entity.followers,
      following: entity.following,
      imagePath: entity.imagePath,
    );
  }

  /// Converts this [UserModel] instance into a [UserEntity] instance.
  ///
  /// This method is used to convert a [UserModel] object back into a [UserEntity] object.
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      username: Username.dirty(username),
      followers: followers,
      following: following,
      imagePath: imagePath,
    );
  }
}
