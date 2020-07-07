class Todo {
  String _id;
  String _title;
  String _body;
  bool _state = false;

  Todo({String id, String title, String body, bool state}) {
    _id = id ?? null;
    _title = title ?? '';
    _body = body ?? '';
    _state = state ?? _state;
  }

  Todo.prepare(this._id, this._title, this._body, this._state);

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

  bool get state => _state;

  set state(bool value) {
    _state = value;
  }

  @override
  List<Object> get props => [id, title, body];

  @override
  String toString() => 'Todo { id: $id }';
}
