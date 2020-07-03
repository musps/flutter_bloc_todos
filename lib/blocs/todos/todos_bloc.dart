import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_demo/blocs/todos/todos.dart';
import 'package:flutter_bloc_demo/models/todo_model.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc() : super(TodosInitial());

  @override
  Stream<TodosState> mapEventToState(TodosEvent event) async* {
    if (event is TodosInitial) {
      yield* _mapTodosLoadedToState();
    } else if (event is TodosFetched) {
      yield* _mapTodosLoadedToState();
    } else if (event is TodoAdd) {
      yield* _mapTodoAddedToState(event);
    }
  }

  Stream<TodosState> _mapTodosLoadedToState() async* {
    yield TodosSuccess(items: [
      new Todo(id: 0, title: 'default 1', body: 'default 1'),
      new Todo(id: 1, title: 'default 2', body: 'default 2'),
    ]);
  }

  Stream<TodosState> _mapTodoAddedToState(TodoAdd event) async* {
    if (state is TodosSuccess) {
      final Todo todo = event.todo;
      final List<Todo> updatedTodos = List.from((state as TodosSuccess).props)
        ..add(todo);
      yield TodosSuccess(items: updatedTodos);
    }
  }
}
