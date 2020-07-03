import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/blocs/todos/todos.dart';
import 'package:flutter_bloc_demo/models/todo_model.dart';
import 'package:flutter_bloc_demo/widgets/todo_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<TodosBloc, TodosState>(builder: (context, state) {
        if (state is TodosInitial) {
          return Text('loading');
        }
        if (state is TodosFailure) {
          return Text('error while loading');
        }

        final List<Todo> todos = state.props;

        return ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            final Todo todo = todos[index];
            return TodoWidget(todo: todo);
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/todo/add');
          print('add new task');
        },
        tooltip: 'Add new task',
        child: Icon(Icons.add),
      ),
    );
  }
}
