import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_demo/models/todo_model.dart';

abstract class TodosEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class TodosFetched extends TodosEvent {}

class TodoAdd extends TodosEvent {
  final Todo todo;

  TodoAdd(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'TodoAdded { todo: $todo }';
}
