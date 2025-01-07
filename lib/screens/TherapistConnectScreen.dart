import 'package:flutter/material.dart';
import 'chat_screen.dart';

class TherapistConnectScreen extends StatefulWidget {
  const TherapistConnectScreen({Key? key}) : super(key: key);

  @override
  State<TherapistConnectScreen> createState() => _TherapistConnectScreenState();
}

class _TherapistConnectScreenState extends State<TherapistConnectScreen> {
  // List to store saved chats
  final List<Map<String, dynamic>> _savedChats = [];

  void _openChat() async {
    // Navigate to ChatScreen and wait for chat data to be returned
    final chatData = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChatScreen()),
    );

    // If chatData is returned, save it in the list
    if (chatData != null && chatData['messages'].isNotEmpty) {
      setState(() {
        _savedChats.add(chatData);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBEFF8), // Pastel background
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5A8C4), // Pastel pink
        title: const Text(
          'Therapist Connect',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Saved Conversations',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color(0xFF454545),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: _savedChats.isEmpty
                  ? const Center(
                      child: Text(
                        'No conversations yet. Start one by clicking the button below!',
                        style: TextStyle(fontSize: 16, color: Color(0xFF7A7A7A)),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : ListView.builder(
                      itemCount: _savedChats.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            leading: const Icon(
                              Icons.chat_bubble_outline,
                              color: Color(0xFFF5A8C4),
                            ),
                            title: Text(
                              _savedChats[index]['name'] ?? 'Unnamed Chat',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xFF454545),
                              ),
                            ),
                            onTap: () {
                              // Optionally re-open the chat if needed
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFF5A8C4),
        onPressed: _openChat,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
