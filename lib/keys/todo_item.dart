import 'package:flutter/material.dart';

enum Priority {urgent, normal, low}

class TodoItem extends StatelessWidget{

  final String text;
  final Priority priority;

  const TodoItem(this.text, this.priority, {super.key});
  
  @override
  Widget build(BuildContext context) {
    var icon = Icons.low_priority;

    if(priority == Priority.low){
      icon = Icons.low_priority;
    }
    else if(priority == Priority.normal){
      icon = Icons.notifications_active;
    }
    else{
      icon = Icons.list;
    }
    
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 7,),
          Text(text),
        ],
      ),
      );
  }
  
}