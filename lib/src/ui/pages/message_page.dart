import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {

    final String message =  ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(message),
        centerTitle: true,
      ),
      body: Center(
        child: Text(message),
      ),
      
    );
  }
}