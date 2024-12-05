import 'package:flutter/material.dart';
import 'package:todo/keys/keys.dart';

class Todo extends StatelessWidget{
  const Todo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: const Keys(),
    ),
      ),
    );
  }
  
}