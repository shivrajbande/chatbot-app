import 'package:chatbot_assignement/controller/message_contoller.dart';
import 'package:chatbot_assignement/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home();

  @override
  Widget build(BuildContext context) {
    return 

    Scaffold(
      endDrawer:const Drawer(backgroundColor:  Color.fromARGB(255, 66, 66, 66),),
      backgroundColor: const Color.fromARGB(255, 47, 47, 47),
      appBar: AppBar(
        iconTheme:const IconThemeData(color: Color.fromARGB(255, 230, 230, 230)),
        backgroundColor: const Color(0xFF0d0d0d),
        title: const Text(
          "ChatBot",
          style: TextStyle(color: Color.fromARGB(255, 230, 230, 230)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top :8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //listview to display messages and responses
        
            Expanded(
              child: ListView.builder(
                itemCount:
                    Provider.of<MessageController>(context).messages.length,
                itemBuilder: (context, index) {
                  MessageModel messageModel =
                      Provider.of<MessageController>(context).messages[index];
                  return Container(
                     margin: messageModel.userType != "User"
                                ? const EdgeInsets.only(bottom: 10.0, left: 4.0)
                                : const EdgeInsets.only(left: 4.0,bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          margin : const EdgeInsets.only(right: 6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                                color: const Color.fromARGB(255, 207, 207, 207)),
                          ),
                          child: Center(
                            child: Text(
                              messageModel.userType[0],
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 230, 230, 230)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: messageModel.userType == "User"
                                    ? Colors.transparent
                                    : const Color.fromARGB(255, 25, 25, 25),
                                borderRadius: BorderRadius.circular(8)),
                            padding: EdgeInsets.only(left : 8.0,top:messageModel.userType != "User"? 8.0 : 0.0,bottom:messageModel.userType != "User"? 8.0 : 0.0,  ),
                            child: Text(
                              softWrap: true,
                              maxLines: null,
                              overflow: TextOverflow.visible,
                              Provider.of<MessageController>(context)
                                  .messages[index]
                                  .message!,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 230, 230, 230)),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            //textfield for typing
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 50,
              width: MediaQuery.of(context).size.width / 1.1,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 66, 66, 66),
                  borderRadius: BorderRadius.circular(10.0)),
              child: TextField(
                style: const TextStyle(color: Color.fromARGB(255, 230, 230, 230)),
                controller:
                    Provider.of<MessageController>(context).reqMessageController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.transparent)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.transparent)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.transparent)),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 10.0),
                    prefixIcon: IconButton(
                        onPressed: () {
                          Provider.of<MessageController>(context, listen: false)
                              .sendQuery();
                        },
                        icon: const Icon(
                          Icons.insert_drive_file_outlined,
                          color:  Color.fromARGB(255, 230, 230, 230),
                        )),
                    suffixIcon: Provider.of<MessageController>(context,
                                    listen: false)
                                .isGenerating ==
                            false
                        ? IconButton(
                            onPressed: () {
                              Provider.of<MessageController>(context,
                                      listen: false)
                                  .sendQuery();
                            },
                            icon: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: const Color.fromARGB(255, 230, 230, 230),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                ),
                              ),
                            ))
                        : IconButton(
                            onPressed: () {
                              // Provider.of<MessageController>(context,
                              //         listen: false)
                              //     .sendQuery();
                            },
                            icon: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: const Color.fromARGB(255, 230, 230, 230),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.stop_circle_outlined,
                                  color: Colors.black,
                                ),
                              ),
                            ))),
              ),
            ),
          ],
        ),
      ),
    );
 
  }
}
