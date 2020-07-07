import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/blocs/todos/todos.dart';
import 'package:flutter_bloc_demo/models/todo_model.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _onClickToggleState = () {
      todo.state = !todo.state;
      BlocProvider.of<TodosBloc>(context).add(TodoToggleState(todo));
    };
    var _onClickUpdate =
        () => Navigator.of(context).pushNamed('/todo/add', arguments: todo);
    var _onDismissedToDelete =
        (dir) => BlocProvider.of<TodosBloc>(context).add(TodoDelete(todo.id));

    return Dismissible(
        key: Key(todo.id),
        onDismissed: _onDismissedToDelete,
        direction: DismissDirection.endToStart,
        background: Container(
          color: Colors.red.withOpacity(0.9),
          padding: EdgeInsets.symmetric(horizontal: 20),
          alignment: AlignmentDirectional.centerEnd,
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        child: Card(
            margin: EdgeInsets.only(top: 10, right: 20, bottom: 10, left: 20),
            child: Column(children: <Widget>[
              ListTile(
                onTap: _onClickUpdate,
                title: Text(todo.title,
                    style: TextStyle(color: Colors.black, fontSize: 18)),
                isThreeLine: false,
                subtitle: Text(todo.body),
              ),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    onPressed: _onClickToggleState,
                    child: todo.state ? Text('Done') : Text('In progress'),
                  ),
                ],
              ),
            ])));
  }
}
