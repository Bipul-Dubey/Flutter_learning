import 'package:flutter/material.dart';
import 'package:xflashchat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;
late final User currentLoggedIn;

class ChatScreen extends StatefulWidget {
  static const String id ='chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController message = TextEditingController();
  final _auth = FirebaseAuth.instance;

  void getCurrentUser() async {
    try{
      final currentUser = await _auth.currentUser!;
      if(currentUser!=null){
        currentLoggedIn = currentUser;
      }
    }catch(e){
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                //Implement logout functionality
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const MessageStreamBuilder(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: message,
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:MaterialStatePropertyAll<Color>(Colors.red.shade100)
                    ),
                    onPressed: () {
                      //Implement send functionality.
                      _firestore.collection('messages').add({
                        "text":message.text,
                        "sender": currentLoggedIn.email,
                        "timestamp" : FieldValue.serverTimestamp()
                      });
                     message.clear();
                    },
                    child: const Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String sender;
  final String message;
  final bool isMe;
  const MessageBubble({super.key, required this.sender, required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(sender,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black54
          ),),
          Material(
            elevation: 7,
            borderRadius: isMe ? const BorderRadius.only(
              topLeft: Radius.circular(18),
              bottomLeft: Radius.circular(18),
              bottomRight: Radius.circular(18)
            ) : const BorderRadius.only(
                topRight: Radius.circular(18),
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18)
            ),
            color: isMe ? Colors.lightBlueAccent : Colors.redAccent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }
}

class MessageStreamBuilder extends StatelessWidget {
  const MessageStreamBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore.collection("messages").orderBy('timestamp').snapshots(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final messages = snapshot.data?.docs.reversed;
        List<MessageBubble> messagesWidgets =[];
        for(var message in messages!){
          final messageText = message.data()['text'];
          final messageSender = message.data()['sender'];

          var currentUser = currentLoggedIn.email;

          final messageWidget = MessageBubble(
            sender: messageSender,
            message: messageText,
            isMe: currentUser==messageSender,
          );
          messagesWidgets.add(messageWidget);
        }
        return Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
            reverse: true,
            children: messagesWidgets,
          ),
        );
      },
    );
  }
}

