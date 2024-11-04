import 'package:json_annotation/json_annotation.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel {
  String? message;
  String messageId;
  String userType;
  MessageModel({required this.message, required this.messageId,required this.userType});
}
