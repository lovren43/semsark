import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/chat/chat_user_model.dart';
import '../../provider/chat_provider.dart';
import '../chat/conversationList.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        double height = MediaQuery.of(context).size.height ;

    var provider = Provider.of<ChatProvider>(context);
    List<ChatUsers> chatUsers = provider.chatUsers;
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Conversations",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.shade100)),
                ),
              ),
            ),
            (chatUsers.isNotEmpty
                ? ListView.builder(
                    itemCount: chatUsers.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 16),
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ConversationList(
                        name: chatUsers[index].username,
                        messageText: "",
                        imageUrl: chatUsers[index].image,
                        time: "",
                        isMessageRead: true,
                        email: chatUsers[index].email,
                        id: chatUsers[index].id,
                      );
                    },
                  )
                : Column(
                  children: [
                    SizedBox(
                      height: 0.4*height,
                    ),
                    Center(child: Text("No messages yet",style:TextStyle(fontSize: 25 )))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
