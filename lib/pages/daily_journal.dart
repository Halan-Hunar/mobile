import 'package:flutter/material.dart';

class DailyJournalPage extends StatefulWidget {
  const DailyJournalPage({super.key});

  @override
  _DailyJournalPageState createState() => _DailyJournalPageState();
}

class _DailyJournalPageState extends State<DailyJournalPage> {
  final List<Map<String, String>> _journals = []; // List to store journal entries

  void _addJournalEntry(String title, String entry, String mood) {
    setState(() {
      _journals.insert(0, {
        'title': title,
        'entry': entry,
        'mood': mood
      }); // Add new entry to the top of the list
    });
  }

  void _showAddJournalDialog() {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController entryController = TextEditingController();
    String selectedMood = '😊';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('New Journal Entry'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setDialogState) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        hintText: 'Journal Title',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: entryController,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        hintText: 'Write about your day...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text('Select your mood:'),
                    Wrap(
                      spacing: 10.0,
                      children: ['😊', '😔', '😡', '😌', '😢', '🤔'].map((mood) {
                        return ChoiceChip(
                          label:
                              Text(mood, style: const TextStyle(fontSize: 24)),
                          selected: selectedMood == mood,
                          onSelected: (bool selected) {
                            setDialogState(() {
                              selectedMood = mood;
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Close dialog
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    entryController.text.isNotEmpty) {
                  _addJournalEntry(
                      titleController.text, entryController.text, selectedMood);
                  Navigator.pop(context); // Close dialog after saving
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Journal'),
        centerTitle: true,
        backgroundColor: const Color(0xFFC8E6C9),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Journals:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: _journals.isEmpty
                  ? const Center(
                      child: Text(
                        'No journal entries yet. Start by adding one!',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _journals.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            leading: Text(
                              _journals[index]['mood'] ?? '',
                              style: const TextStyle(fontSize: 24),
                            ),
                            title: Text(
                              _journals[index]['title'] ?? '',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              _journals[index]['entry'] ?? '',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddJournalDialog,
        backgroundColor: const Color(0xFFC8E6C9),
        child: const Icon(Icons.add),
      ),
    );
  }
}
