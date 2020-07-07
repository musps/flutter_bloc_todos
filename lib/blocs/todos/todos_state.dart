import 'package:flutter_bloc_demo/models/todo_model.dart';

abstract class TodosState {
  const TodosState();

  @override
  List<Todo> get props => [];
}

class TodosInitial extends TodosState {}

class TodosFailure extends TodosState {}

class TodosSuccess extends TodosState {
  final List<Todo> items;

  const TodosSuccess({this.items = const []});

  @override
  List<Todo> get props => items;

  @override
  String toString() => 'TodosLoaded { items: ${items.length} }';
}
