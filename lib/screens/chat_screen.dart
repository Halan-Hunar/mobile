import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final List<Map<String, String>> initialMessages;

  const ChatScreen({Key? key, this.initialMessages = const []}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late List<Map<String, String>> _messages;
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _messages = List<Map<String, String>>.from(widget.initialMessages);
  }

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        _messages.add({'sender': 'User', 'text': _messageController.text});
        _messages.add({'sender': 'Therapist', 'text': 'I’m here to help 😊'});
      });
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat with Therapist'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
           leading: IconButton(
  icon: const Icon(Icons.arrow_back),
  onPressed: () {
    print('Returning chat data: $_messages'); // Print chat data
    Navigator.pop(context, {
      'name': _messages.isNotEmpty ? _messages[0]['text'] : 'Unnamed Chat',
      'messages': _messages,
    });
  },
);

          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isUser = message['sender'] == 'User';

                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blueAccent : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      message['text']!,
                      style: TextStyle(
                        color: isUser ? Colors.white : Colors.black87,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            color: Colors.grey[200],
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Type your message...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blue),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
