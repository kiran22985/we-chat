import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'chat_user_model.g.dart';

@JsonSerializable()
class ChatUser extends Equatable {
  @override
  List<Object?> get props => [
        image,
        about,
        name,
        createdAt,
        isOnline,
        id,
        lastActive,
        email,
        pushToken
      ];
  const ChatUser({
    required this.about,
    required this.name,
    required this.createdAt,
    required this.isOnline,
    required this.id,
    required this.lastActive,
    required this.image,
    required this.email,
    required this.pushToken,
  });

  factory ChatUser.fromJson(Map<String, dynamic> json) =>
      _$ChatUserFromJson(json);

  final String image;
  final String about;
  final String name;
  final String createdAt;
  final bool isOnline;
  final String id;
  final String lastActive;
  final String email;
  final String pushToken;

  Map<String, dynamic> toJson() => _$ChatUserToJson(this);
}
