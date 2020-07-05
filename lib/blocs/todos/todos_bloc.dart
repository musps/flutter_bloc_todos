import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:uuid/uuid.dart';
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
    } else if (event is TodoDelete) {
      yield* _mapTodoDeletedToState(event);
    }
  }

  Stream<TodosState> _mapTodosLoadedToState() async* {
    var uuid = Uuid();
    yield TodosSuccess(items: [
      new Todo(id: uuid.v4(), title: 'default 1', body: 'default 1'),
      new Todo(id: uuid.v4(), title: 'default 2', body: 'default 2'),
    ]);
  }

  Stream<TodosState> _mapTodoAddedToState(TodoAdd event) async* {
    if (state is TodosSuccess) {
      var uuid = Uuid();
      final Todo todo = event.todo;
      todo.id = uuid.v4();

      final List<Todo> updatedTodos = List.from((state as TodosSuccess).props)
        ..add(todo);
      yield TodosSuccess(items: updatedTodos);
    }
  }

  Stream<TodosState> _mapTodoDeletedToState(TodoDelete event) async* {
    final String uuid = event.uuid;
    final List<Todo> updatedTodos = List.from((state as TodosSuccess).props);
    updatedTodos.removeWhere((todo) => todo.id == uuid);

    yield TodosSuccess(items: updatedTodos);
  }
}
