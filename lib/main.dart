import 'package:chatbot_assignement/controller/message_contoller.dart';
import 'package:chatbot_assignement/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MessageController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
