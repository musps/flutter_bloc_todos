import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_bloc_demo/blocs/todos/todos.dart';
import 'package:flutter_bloc_demo/models/todo_model.dart';
import 'package:flutter_bloc_demo/mock_data.dart';

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
    } else if (event is TodoUpdate) {
      yield* _mapTodoUpdateToState(event);
    } else if (event is TodoToggleState) {
      yield* _mapTodoToggleStateToState(event);
    }
  }

  Stream<TodosState> _mapTodosLoadedToState() async* {
    yield TodosSuccess(items: []);
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

  Stream<TodosState> _mapTodoUpdateToState(TodoUpdate event) async* {
    if (state is TodosSuccess) {
      final List<Todo> updatedTodos = (state as TodosSuccess).props.map((todo) {
        if (todo.id == event.todo.id) {
          return event.todo;
        }
        return todo;
      }).toList();

      yield TodosSuccess(items: updatedTodos);
    }
  }

  Stream<TodosState> _mapTodoToggleStateToState(TodoToggleState event) async* {
    if (state is TodosSuccess) {
      final List<Todo> updatedTodos = (state as TodosSuccess).props.map((todo) {
        if (todo.id == event.todo.id) {
          todo.state = event.todo.state;
        }
        return todo;
      }).toList();
      yield TodosSuccess(items: updatedTodos);
    }
  }
}
