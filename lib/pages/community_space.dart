import 'package:flutter/material.dart';

class CommunitySpaceScreen extends StatefulWidget {
  final String username;

  const CommunitySpaceScreen({Key? key, required this.username}) : super(key: key);

  @override
  _CommunitySpaceScreenState createState() => _CommunitySpaceScreenState();
}

class _CommunitySpaceScreenState extends State<CommunitySpaceScreen> {
  final TextEditingController _postController = TextEditingController();
  List<Map<String, dynamic>> _posts = [];

  void _addPost(String content) {
    setState(() {
      _posts.insert(0, {
        'username': widget.username.isEmpty ? 'User123' : widget.username,
        'content': content,
        'comments': <String>[], // Initialize as an empty list
        'likes': 0,
        'timestamp': DateTime.now(),
      });
    });
    _postController.clear();
  }

  void _addComment(int postIndex, String comment) {
    setState(() {
      _posts[postIndex]['comments'].add(comment);
    });
  }

  void _incrementLikes(int postIndex) {
    setState(() {
      _posts[postIndex]['likes'] += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Space'),
        centerTitle: true,
        backgroundColor: const Color(0xFF90CAF9),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _postController,
                    decoration: InputDecoration(
                      hintText: 'Share something...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_postController.text.isNotEmpty) {
                      _addPost(_postController.text);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF90CAF9),
                  ),
                  child: const Text('Post'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _posts.length,
                itemBuilder: (context, index) {
                  final post = _posts[index];
                  return _buildPostCard(post, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPostCard(Map<String, dynamic> post, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3E0), // Light pastel background
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post['username'],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFF5D4037),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            post['content'],
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF6D4C41),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Posted on: ${post['timestamp'].toString().substring(0, 19)}',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const Divider(height: 20, thickness: 1),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.thumb_up_alt_rounded, color: Colors.pinkAccent),
                onPressed: () {
                  _incrementLikes(index);
                },
              ),
              Text(post['likes'].toString()),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.comment_rounded, color: Colors.blueAccent),
                onPressed: () {
                  _showCommentDialog(index);
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (post['comments'].isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: post['comments']
                  .map<Widget>((comment) => Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          '- $comment',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF5D4037),
                          ),
                        ),
                      ))
                  .toList(),
            ),
        ],
      ),
    );
  }

  void _showCommentDialog(int postIndex) {
    final TextEditingController commentController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add a Comment'),
          content: TextField(
            controller: commentController,
            decoration: const InputDecoration(
              hintText: 'Write a comment...',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (commentController.text.isNotEmpty) {
                  _addComment(postIndex, commentController.text);
                  Navigator.pop(context);
                }
              },
              child: const Text('Post'),
            ),
          ],
        );
      },
    );
  }
}
