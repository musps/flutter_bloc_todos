import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/blocs/todos/todos.dart';
import 'package:flutter_bloc_demo/models/todo_model.dart';

class AddEditScreen extends StatefulWidget {
  AddEditScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AddEditScreenState createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  TodosBloc _todosBloc;

  final _title = TextEditingController();
  final _body = TextEditingController();

  @override
  void initState() {
    super.initState();
    _todosBloc = BlocProvider.of<TodosBloc>(context);
  }

  void _onSave() {
    _todosBloc.add(TodoAdd(new Todo(title: _title.text, body: _body.text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _title,
              initialValue: null,
              decoration: InputDecoration(labelText: 'Task title'),
            ),
            TextFormField(
              controller: _body,
              initialValue: null,
              decoration: InputDecoration(labelText: 'Task body'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onSave,
        tooltip: 'Save todo',
        child: Icon(Icons.done),
      ),
    );
  }
}
