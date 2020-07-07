import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/blocs/todos/todos.dart';
import 'package:flutter_bloc_demo/models/todo_model.dart';
import 'package:flutter_bloc_demo/widgets/todo_widget.dart';
import 'package:flutter_bloc_demo/theme.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  final String title = 'Today';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Center _messageInfo(String text) {
    return Center(
        child: Text(text, style: TextStyle(color: Colors.black, fontSize: 22)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomThemeData.grey,
      appBar: AppBar(
        brightness: Brightness.light,
        centerTitle: false,
        title: Text(widget.title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 30)),
        backgroundColor: CustomThemeData.grey,
        elevation: 0.0,
      ),
      body: BlocBuilder<TodosBloc, TodosState>(builder: (context, state) {
        if (state is TodosInitial) {
          return _messageInfo('loading');
        }
        if (state is TodosFailure) {
          return _messageInfo('error while loading');
        }

        final List<Todo> todos = state.props;

        if (todos.length == 0) {
          return _messageInfo('No data available');
        }

        return ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            final Todo todo = todos[index];
            return TodoWidget(todo: todo);
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CustomThemeData.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        onPressed: () => Navigator.pushNamed(context, '/todo/add'),
        child: Icon(Icons.add),
      ),
    );
  }
}
