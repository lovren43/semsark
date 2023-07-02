import 'package:flutter/material.dart';
//import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:provider/provider.dart';

import '../../provider/chat_provider.dart';
import 'chat_detial.dart';

class ConversationList extends StatelessWidget {
  String name;
  String messageText;
  String imageUrl;
  String time;
  bool isMessageRead;
  int id;
  String email;
  ConversationList(
      {required this.name,
      required this.email,
      required this.id,
      required this.messageText,
      required this.imageUrl,
      required this.time,
      required this.isMessageRead});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ChatProvider>(context);

    return GestureDetector(
      onTap: () {
        provider.getRoom(email);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ChatDetailPage(index: id-1);
        }));
      },
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(imageUrl==null||imageUrl=="string"||imageUrl==""?'assets/images/avtar.png':imageUrl),
                    backgroundColor: Colors.white,
                    maxRadius: 30,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            name,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            messageText,
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade600,
                                fontWeight: isMessageRead
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              time,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight:
                      isMessageRead ? FontWeight.bold : FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
