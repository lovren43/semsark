import 'package:flutter/cupertino.dart';
import 'package:semsark/Repo/remote/remote_status.dart';
import 'package:semsark/models/chat/chat_user_model.dart';
import '../Repo/chat_services.dart';
import '../models/chat/chat_message_model.dart';

class ChatProvider with ChangeNotifier {
  String currentUser = "kk@gmail.com";
  int room = 0;
  ChatMessage message =
      ChatMessage(receiverEmail: "", message: "", status: true, date: "");
  List<ChatUsers> chatUsers = [];
  List<ChatMessage> chatMessages = [];
  bool loading = false;
  ChatServices services = ChatServices();
  init() async {
    setLoading(true);
    await setUser();
    setLoading(false);
  }

  ChatProvider() {
    init();
  }

  Future<void> setUser() async {
    var response = await services.getChatUser();
    if (response is Success) {
      chatUsers = response.response as List<ChatUsers>;
    }
    notifyListeners();
  }

  Future<void> getAllMessage() async {
    var response = await services.getChatMessage(room);
    if (response.isNotEmpty) {
      chatMessages = response as List<ChatMessage>;
    }
    notifyListeners();
  }

  Future<void> sendMessage() async {
    chatMessages.add(ChatMessage(receiverEmail: message.receiverEmail, message: message.message, status: true, date: message.date));
    await services.sendChatMessage(message);
    notifyListeners();
  }

  void setLoading(loading) {
    this.loading = loading;
    notifyListeners();
  }

  setMessage(message) {
    this.message.message = message;
    notifyListeners();
  }

  setDate(date) {
    this.message.date = date;
    notifyListeners();
  }

  setReciverEmail(reciverEmail) {
    this.message.receiverEmail = reciverEmail;
    notifyListeners();
  }

  getRoom(email) async {
    var response = await services.getChatRoom(email);
    if (response is Success) {
      this.room = response.response as int;
      await getAllMessage();
    }
    notifyListeners();
  }
}
