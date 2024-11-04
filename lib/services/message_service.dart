import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:groq/groq.dart';

class MessageServices {
  final groq = Groq(apiKey: dotenv.env['groqApiKey']!);

  Future<String> fetchResponse(String? query) async {
    try {
      groq.startChat();

      GroqResponse response = await groq.sendMessage(query!);

      return response.choices.first.message.content;
    } catch (error) {
      print("error in servier is ${error}");
    }
    return "";
  }
}
