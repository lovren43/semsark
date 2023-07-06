import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:semsark/Repo/home_services.dart';
import 'package:semsark/Repo/remote/remote_status.dart';
import 'package:semsark/models/chat/chat_user_model.dart';
import 'package:semsark/models/response/user_details.dart';
import '../Repo/chat_services.dart';
import '../models/chat/chat_message_model.dart';

class ChatProvider with ChangeNotifier {
  String currentUserEmail = "";
  String? reciverEmail;
  UserDetails? curUser;
  String room = "";

  ChatMessage message =
      ChatMessage(receiverEmail: "", message: "", status: true, date: "");

  List<ChatUsers> chatUsers = [];
  List<ChatMessage> chatMessages = [];
  bool loading = false;
  ChatServices services = ChatServices();

  init() async {
    setLoading(true);
    await setUser();
    await getCurrentUser() ;
    setLoading(false);
  }

  setReciverEmail(email){
    reciverEmail = email ;
    notifyListeners() ;
  }
  getCurrentUser() async {
    var response = await HomeServices().getUser() ;
    if(response is Success){
      curUser = response.response as UserDetails ;
      currentUserEmail = curUser!.email ;
    }
    else{
      currentUserEmail = "islammabououf@gmail.com";
    }
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

  void getAllMessage() async{
    //chatMessages=[];
    FirebaseApp firebaseApp = Firebase.app();
    FirebaseDatabase database = FirebaseDatabase.instanceFor(app:firebaseApp);

    database.ref('chat/$room/').onValue.listen((DatabaseEvent event) {
      final snapshot = event.snapshot.value;
      print(snapshot) ;
      Map<dynamic, dynamic>? dataMap = snapshot as Map<dynamic, dynamic>?;

      if (dataMap != null) {
        // dataMap.forEach((key, value) {
        //   //chatMessages.add(ChatMessage( receiverEmail: value["receiverEmail"], message: value["message"], status: value["status"], date: value["dates"]));
        // });
        changeList(dataMap) ;
      }
      // chatMessages.removeWhere((element) => element.receiverEmail!=reciverEmail&&element.receiverEmail!=currentUserEmail);
      // chatMessages.sort((a, b) => a.date.compareTo(b.date));

    });
  }
  changeList(map){
    chatMessages = [];
    map.forEach((key, value) {
      chatMessages.add(ChatMessage( receiverEmail: value["receiverEmail"], message: value["message"], status: value["status"], date: value["dates"]));
    });
    chatMessages.removeWhere((element) => element.receiverEmail!=reciverEmail&&element.receiverEmail!=currentUserEmail);
    chatMessages.sort((a, b) => a.date.compareTo(b.date));
    notifyListeners();
  }
  Future<void> getChatsFromFirebase() async {
    chatMessages=[];
    FirebaseApp firebaseApp = Firebase.app();
    FirebaseDatabase database = FirebaseDatabase.instanceFor(app: firebaseApp);
    DatabaseReference chatRef = database.ref('chat/${room}/');
    DatabaseEvent snapshot = await chatRef.once();
    Map<dynamic, dynamic>? dataMap = snapshot.snapshot.value as Map<dynamic, dynamic>?;

    if (dataMap != null) {
      dataMap.forEach((key, value) {

          chatMessages.add(
              ChatMessage(
            receiverEmail: value["receiverEmail"],
            message: value["message"],
            status: value["status"],
            date: value["dates"],
          ));

      });

      // Sort messages based on the desired criteria (e.g., date)
      chatMessages.removeWhere((element) => element.receiverEmail!=reciverEmail&&element.receiverEmail!=currentUserEmail);
      chatMessages.sort((a, b) => a.date.compareTo(b.date));
    }

  }
  Future<void> sendMessage() async {
    chatMessages.add(ChatMessage(receiverEmail: reciverEmail!, message: message.message, status: true, date: message.date));
    await services.sendChatMessage(ChatMessage(receiverEmail: reciverEmail!, message: message.message, status: true, date: message.date));
    await getChatsFromFirebase();
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

  // setReciverEmail(reciverEmail) {
  //   this.message.receiverEmail = reciverEmail;
  //   notifyListeners();
  // }

  getRoom(email) async {
    var response = await services.getChatRoom(email);
    if (response is Success) {
      print(response.response);
      this.room = response.response.toString();
      getAllMessage();
      //await getChatsFromFirebase();
    }
    notifyListeners();
  }
}
