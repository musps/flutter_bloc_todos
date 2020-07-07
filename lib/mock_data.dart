import 'package:flutter_bloc_demo/models/todo_model.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

List<Todo> mock_todos = [
  new Todo(id: uuid.v4(), title: 'default 1', body: 'default 1', state: true),
  new Todo(id: uuid.v4(), title: 'default 2', body: 'default 2', state: false),
  new Todo(id: uuid.v4(), title: 'default 3', body: 'default 3', state: true),
  new Todo(id: uuid.v4(), title: 'default 4', body: 'default 4', state: false),
  new Todo(id: uuid.v4(), title: 'default 5', body: 'default 5', state: false),
  new Todo(id: uuid.v4(), title: 'default 1', body: 'default 1', state: true),
  new Todo(id: uuid.v4(), title: 'default 2', body: 'default 2', state: false),
  new Todo(id: uuid.v4(), title: 'default 3', body: 'default 3', state: true),
  new Todo(id: uuid.v4(), title: 'default 4', body: 'default 4', state: false),
  new Todo(id: uuid.v4(), title: 'default 5', body: 'default 5', state: false),
  new Todo(id: uuid.v4(), title: 'default 1', body: 'default 1', state: true),
  new Todo(id: uuid.v4(), title: 'default 2', body: 'default 2', state: false),
  new Todo(id: uuid.v4(), title: 'default 3', body: 'default 3', state: true),
  new Todo(id: uuid.v4(), title: 'default 4', body: 'default 4', state: false),
  new Todo(id: uuid.v4(), title: 'default 5', body: 'default 5', state: false),
  new Todo(id: uuid.v4(), title: 'default 1', body: 'default 1', state: true),
  new Todo(id: uuid.v4(), title: 'default 2', body: 'default 2', state: false),
  new Todo(id: uuid.v4(), title: 'default 3', body: 'default 3', state: true),
  new Todo(id: uuid.v4(), title: 'default 4', body: 'default 4', state: false),
  new Todo(id: uuid.v4(), title: 'default 5', body: 'default 5', state: false),
];
