import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  String _id;
  String _title;
  String _body;

  Todo({String id, String title, String body}) {
    _id = id ?? null;
    _title = title ?? '';
    _body = body ?? '';
  }
  Todo.prepare(this._id, this._title, this._body);

  String get body => _body;

  set body(String value) {
    _body = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  @override
  List<Object> get props => [id, title, body];

  @override
  String toString() => 'Todo { id: $id }';
}
