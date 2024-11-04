// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
      message: json['message'] as String?,
      messageId: json['messageId'] as String,
      userType: json['userType'] as String,
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'messageId': instance.messageId,
      'userType': instance.userType,
    };
