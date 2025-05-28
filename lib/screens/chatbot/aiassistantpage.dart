import 'package:flutter/material.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'messages.dart';

class AssistantScreen extends StatefulWidget {
  const AssistantScreen({super.key});

  @override
  _AiAssistanceScreenState createState() => _AiAssistanceScreenState();
}

class _AiAssistanceScreenState extends State<AssistantScreen> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    super.initState();
    dialogFlowtter = DialogFlowtter();
  }

  void sendMessage(String text) async {
    if (text.isEmpty) return;

    setState(() {
      addMessage(Message(text: DialogText(text: [text])), true);
    });

    DetectIntentResponse response = await dialogFlowtter.detectIntent(
      queryInput: QueryInput(text: TextInput(text: text)),
    );

    if (response.message == null) return;

    setState(() {
      addMessage(response.message!);
    });

    Future.delayed(Duration(milliseconds: 300), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  void addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ai Assistant',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: MessagesScreen(
              messages: messages,
              controller: _scrollController,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            color: Colors.grey.shade400,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                    decoration: InputDecoration(
                      hintText: "Type a message",
                      hintStyle:
                          TextStyle(color: const Color.fromARGB(153, 0, 0, 0)),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    sendMessage(_controller.text);
                    _controller.clear();
                  },
                  icon: Icon(Icons.send,
                      color: const Color.fromARGB(255, 0, 0, 0)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
