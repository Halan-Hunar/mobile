import 'package:flutter/material.dart';
import 'dart:async';

class MeditationTimerScreen extends StatefulWidget {
  final String title;
  final int duration; // Duration in minutes

  const MeditationTimerScreen({Key? key, required this.title, required this.duration}) : super(key: key);

  @override
  _MeditationTimerScreenState createState() => _MeditationTimerScreenState();
}

class _MeditationTimerScreenState extends State<MeditationTimerScreen> {
  late Timer _timer;
  int _remainingSeconds = 0;
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.duration * 60;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
          _progress = 1.0 - (_remainingSeconds / (widget.duration * 60));
        });
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final minutes = (_remainingSeconds / 60).floor();
    final seconds = _remainingSeconds % 60;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor ?? theme.primaryColor,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Time Remaining',
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            Text(
              '$minutes:${seconds.toString().padLeft(2, '0')}',
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            LinearProgressIndicator(
              value: _progress,
              backgroundColor: Colors.grey[300],
              color: theme.primaryColor,
              minHeight: 10,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                _timer.cancel();
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
              child: const Text('End Session'),
            ),
          ],
        ),
      ),
    );
  }
}
