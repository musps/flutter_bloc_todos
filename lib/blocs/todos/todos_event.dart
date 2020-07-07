import 'package:flutter_bloc_demo/models/todo_model.dart';

abstract class TodosEvent {
  @override
  List<Object> get props => [];
}

class TodosFetched extends TodosEvent {}

class TodoDelete extends TodosEvent {
  final String uuid;
  TodoDelete(this.uuid);
}

class TodoToggleState extends TodosEvent {
  final Todo todo;
  TodoToggleState(this.todo);

  @override
  List<Object> get props => [todo];
}

class TodoUpdate extends TodosEvent {
  final Todo todo;
  TodoUpdate(this.todo);

  @override
  List<Object> get props => [todo];
}

class TodoAdd extends TodosEvent {
  final Todo todo;

  TodoAdd(this.todo);

  @override
  List<Object> get props => [todo];
}
