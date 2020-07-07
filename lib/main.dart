import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/screens/home_screen.dart';
import 'package:flutter_bloc_demo/screens/add_edit_screen.dart';
import 'package:flutter_bloc_demo/blocs/todos/todos.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(FlutterBlocDemo());
}

class FlutterBlocDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TodosBloc()..add(TodosFetched()),
        child: MaterialApp(
            title: 'Todos',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => HomeScreen(),
              '/todo/add': (context) => AddEditScreen(),
              '/todo/update': (context) => AddEditScreen(),
            }));
  }
}
