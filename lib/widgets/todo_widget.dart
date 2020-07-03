import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/models/todo_model.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        '${todo.id}',
        style: TextStyle(fontSize: 10.0),
      ),
      title: Text(todo.title),
      isThreeLine: true,
      subtitle: Text(todo.body),
      dense: true,
    );
  }
}
