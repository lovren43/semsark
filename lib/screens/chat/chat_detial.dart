import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:semsark/provider/chat_provider.dart';

import '../../models/chat/chat_message_model.dart';

class ChatDetailPage extends StatelessWidget {
  int index;
  final TextEditingController _textEditingController = TextEditingController();

  ChatDetailPage({required this.index});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ChatProvider>(context);
    DateTime currentDate = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy HH:mm:ss').format(currentDate);

    List<ChatMessage> messages = provider.chatMessages;
    double width = MediaQuery.of(context).size.width ;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      provider.chatUsers[index].image == null ||
                              provider.chatUsers[index].image == "string" ||
                              provider.chatUsers[index].image == ""
                          ? 'assets/images/avtar.png'
                          : provider.chatUsers[index].image),
                  maxRadius: 20,
                  backgroundColor: Colors.white,
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        provider.chatUsers[index].username,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Online",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.settings,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children:[
          SingleChildScrollView(
            child: ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding:
                      const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                  child: Align(
                    alignment:
                        (messages[index].receiverEmail != provider.currentUserEmail
                            ? Alignment.topRight
                            : Alignment.topLeft),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            (messages[index].receiverEmail == provider.currentUserEmail
                                ? Colors.grey.shade200
                                : Colors.blue[200]),
                      ),
                      padding: const EdgeInsets.all(16),
                      child:Column(
                        children: [
                          SizedBox(
                            // width: width * messages[index].message.length/10,
                            child: Text(
                              messages[index].message,
                              style: const TextStyle(fontSize: 15),

                            ),
                          ),
                          SizedBox(height: 10,),
                          SizedBox(
                            width: width*0.3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  messages[index].date.substring(0,10),
                                  style: const TextStyle(fontSize: 10,),
                                  textAlign: TextAlign.left,
                                ),

                                Text(
                                  messages[index].date.substring(11),
                                  style: const TextStyle(fontSize: 10),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  // GestureDetector(
                  //   onTap: () {},
                  //   child: Container(
                  //     height: 30,
                  //     width: 30,
                  //     decoration: BoxDecoration(
                  //       color: Colors.lightBlue,
                  //       borderRadius: BorderRadius.circular(30),
                  //     ),
                  //     child: const Icon(
                  //       Icons.add,
                  //       color: Colors.white,
                  //       size: 20,
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      //onChanged: (value) => {provider.setMessage(value)},
                      decoration: const InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      provider.setReciverEmail(provider.chatUsers[index].email);
                      provider.setDate(formattedDate);
                      provider.setMessage(_textEditingController.text);
                      provider.sendMessage();
                      //provider.setMessage("");
                      _textEditingController.clear();
                    },
                    backgroundColor: Colors.blue,
                    elevation: 0,
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
