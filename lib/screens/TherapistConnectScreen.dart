import 'package:flutter/material.dart';
import '../screens/chat_screen.dart';

class TherapistConnectScreen extends StatefulWidget {
  const TherapistConnectScreen({super.key});

  @override
  State<TherapistConnectScreen> createState() => _TherapistConnectScreenState();
}

class _TherapistConnectScreenState extends State<TherapistConnectScreen> {
  final List<Map<String, dynamic>> _savedChats = []; // List to store saved chats

  // Open a new chat
  void _openChat(BuildContext context) async {
    final chatData = await Navigator.push<Map<String, dynamic>>(
      context,
      MaterialPageRoute(
        builder: (context) => const ChatScreen(),
      ),
    );

    // Check if chat data is returned and save it
    if (chatData != null && chatData['messages'].isNotEmpty) {
      setState(() {
        _savedChats.add(chatData);
      });
      if (chatData != null && chatData['messages'].isNotEmpty) {
  setState(() {
    _savedChats.add(chatData);
  });
  print('Saved chats: $_savedChats'); // Print saved chats
} else {
  print('No chat data returned'); // Print if no data is returned
}

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Therapist'),
        centerTitle: true,
      ),
      body: _savedChats.isEmpty
          ? const Center(
              child: Text(
                'No chats yet. Start a new conversation!',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: _savedChats.length,
              itemBuilder: (context, index) {
                final chat = _savedChats[index];
                return ListTile(
                  title: Text(chat['name'] ?? 'Unnamed Chat'),
                  subtitle: Text(
                    '${chat['messages'].length} messages',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(
                          initialMessages: chat['messages'],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openChat(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}