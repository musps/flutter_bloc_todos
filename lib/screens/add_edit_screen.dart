import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/blocs/todos/todos.dart';
import 'package:flutter_bloc_demo/models/todo_model.dart';
import 'package:flutter_bloc_demo/theme.dart';

class AddEditScreen extends StatefulWidget {
  AddEditScreen({Key key}) : super(key: key);
  final String title = '';

  @override
  _AddEditScreenState createState() => _AddEditScreenState();
}

String validateEmpty(String value) {
  if (value.isEmpty) {
    return "Value can't be blank";
  }
  return null;
}

class _AddEditScreenState extends State<AddEditScreen> {
  final _formKey = GlobalKey<FormState>();
  Todo _todo = new Todo();

  @override
  void initState() {
    super.initState();
  }

  void _onSave() {
    if (!_formKey.currentState.validate()) {
      return null;
    }

    final TodosBloc _todosBloc = BlocProvider.of<TodosBloc>(context);

    if (_todo.id != null) {
      _todosBloc.add(TodoUpdate(_todo));
    } else {
      _todosBloc.add(TodoAdd(_todo));
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final Todo todo = ModalRoute.of(context).settings.arguments;
    if (todo is Todo) {
      _todo = todo;
    }

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: CustomThemeData.grey,
        elevation: 0.0,
      ),
      backgroundColor: CustomThemeData.grey,
      body: Container(
        child: Column(children: <Widget>[
          Expanded(
              flex: 3,
              child: Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            initialValue: _todo.title,
                            onChanged: (text) =>
                                setState(() => _todo.title = text),
                            validator: validateEmpty,
                            decoration: InputDecoration(labelText: 'Title'),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            initialValue: _todo.body,
                            onChanged: (text) =>
                                setState(() => _todo.body = text),
                            validator: validateEmpty,
                            decoration: InputDecoration(labelText: 'Body'),
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                          ),
                          SizedBox(height: 20),
                          SwitchListTile(
                            onChanged: (state) =>
                                setState(() => _todo.state = state),
                            title: Text('Done'),
                            activeColor: Colors.green,
                            value: _todo.state,
                          )
                        ],
                      ))))
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: CustomThemeData.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        onPressed: _onSave,
        label: Text('Save'),
        icon: Icon(Icons.done),
      ),
    );
  }
}
