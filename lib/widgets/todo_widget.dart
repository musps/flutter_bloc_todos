import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/blocs/todos/todos.dart';
import 'package:flutter_bloc_demo/models/todo_model.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('/todo/add', arguments: {
            'uuid': todo.id,
          });
        },
        child: ListTile(
          trailing: InkWell(
            child: Icon(Icons.delete),
            onTap: () =>
                BlocProvider.of<TodosBloc>(context).add(TodoDelete(todo.id)),
          ),
          title: Text(todo.title),
          isThreeLine: true,
          subtitle: Text(todo.id),
          dense: true,
        ));
  }
}
