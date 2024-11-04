import 'dart:math';
import 'package:chatbot_assignement/models/message_model.dart';
import 'package:flutter/material.dart';
import '../services/message_service.dart';

class MessageController extends ChangeNotifier {
  List<MessageModel> _messages = [];
  List<MessageModel> get messages => _messages;
  TextEditingController reqMessageController = TextEditingController();
  final MessageServices _messageServices = MessageServices();
 bool isGenerating = false;

  Future<void> sendQuery() async {
    // Add user message
    MessageModel reqMessageModel = MessageModel(
      message: reqMessageController.text,
      messageId: generateRandomMessageId(),
      userType: "User",
    );
    _messages.add(reqMessageModel);
    String query = reqMessageController.text;
    reqMessageController.text = "";
    isGenerating = true;

    // Add an empty bot message placeholder
    MessageModel resMessageModel = MessageModel(
      message: "",
      messageId: generateRandomMessageId(),
      userType: "ChatBot",
    );
    _messages.add(resMessageModel);
    notifyListeners();

    try {
      // Fetch the full bot response
      String response = await _messageServices.fetchResponse(query);
      
      // Populate the bot message progressively
      int botMessageIndex = _messages.length - 1; // Index of the last message
      await generateResponse(response, botMessageIndex);
      isGenerating = false;
      notifyListeners();
    } catch (error) {
      print("error is: $error");
    }
  }

  // Method to generate the response character by character
  Future<void> generateResponse(String fullResponse, int index) async {
    String currentResponse = '';
    for (int i = 0; i < fullResponse.length; i++) {
      currentResponse += fullResponse[i];
      _messages[index].message = currentResponse;
      notifyListeners();
      await Future.delayed(Duration(milliseconds: 50)); // Typing effect delay
    }
  }

  String generateRandomMessageId() {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    return List.generate(
      6,
      (index) => characters[random.nextInt(characters.length)],
    ).join();
  }
}
