import 'package:flutter/material.dart';
import 'package:todo/keys/checkable_todo_items.dart';
//import 'package:todo/keys/todo_item.dart';

class Todo {
  const Todo(this.text, this.priority);

  final String text;
  final Priority priority;
}

class Keys extends StatefulWidget{
  const Keys({super.key});

  @override
  State<Keys> createState() {
    return _KeysState();
  }
}

class _KeysState extends State<Keys>{
  var _order = 'asc';
  final _todos = [
    const Todo('Learn Flutter', Priority.urgent), const Todo('Pracitce Flutter', Priority.normal), const Todo('Explore ther cpurse', Priority.low),
  ];

  List<Todo> get _orderTodos{
    final sortedTodos = List.of(_todos);
    sortedTodos.sort((a, b) {
      final bComesAfterA = a.text.compareTo(b.text);
      return _order == 'asc' ? bComesAfterA : -bComesAfterA;
    });
    return sortedTodos;
  }

  void _changeOrder(){
    setState(() {
      _order = _order == 'asc' ? 'desc' : 'asc';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: _changeOrder,
            icon: Icon(
              _order == 'asc' ? Icons.arrow_downward : Icons.arrow_upward,
            ), 
            label: Text('Sort ${_order == 'asc' ? 'Descending' : 'Ascending'}')),
        ),
        Expanded(
          child: Column(
            children: [
              for(final todo in _orderTodos)
              CheckableTodoItem(
                todo.text,
                todo.priority,
              ),
            ],
          )
        )
      ],
    );
  }

}