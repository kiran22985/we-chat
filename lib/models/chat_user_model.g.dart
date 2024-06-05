// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatUser _$ChatUserFromJson(Map<String, dynamic> json) => ChatUser(
      about: json['about'] as String,
      name: json['name'] as String,
      createdAt: json['createdAt'] as String,
      isOnline: json['isOnline'] as bool,
      id: json['id'] as String,
      lastActive: json['lastActive'] as String,
      image: json['image'] as String,
      email: json['email'] as String,
      pushToken: json['pushToken'] as String,
    );

Map<String, dynamic> _$ChatUserToJson(ChatUser instance) => <String, dynamic>{
      'image': instance.image,
      'about': instance.about,
      'name': instance.name,
      'createdAt': instance.createdAt,
      'isOnline': instance.isOnline,
      'id': instance.id,
      'lastActive': instance.lastActive,
      'email': instance.email,
      'pushToken': instance.pushToken,
    };
