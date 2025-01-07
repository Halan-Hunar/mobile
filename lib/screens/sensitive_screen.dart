import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

class SensitiveScreen extends StatefulWidget {
  const SensitiveScreen({Key? key}) : super(key: key);

  @override
  _SensitiveScreenState createState() => _SensitiveScreenState();
}

class _SensitiveScreenState extends State<SensitiveScreen> {
  @override
  void initState() {
    super.initState();
    _disableScreenshot();
  }

  Future<void> _disableScreenshot() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  void dispose() {
    _enableScreenshot();
    super.dispose();
  }

  Future<void> _enableScreenshot() async {
    await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sensitive Screen')),
      body: const Center(
        child: Text('Sensitive content is protected here.'),
      ),
    );
  }
}
