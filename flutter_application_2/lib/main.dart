import 'package:flutter/material.dart';
import 'package:flutter_application_2/Todos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        // home: MyHomePage(title: 'Flutter Demo Home Page'),
        home: DefaultTabController(length: 2, child: TodoList()));
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final TextEditingController textField = TextEditingController();
  int ListIdx = 0;
  final unfinishedTodoList = new UnFinishedTodoListMap();
  final finsihedTodoList = new FinishedTodoListMap();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('To-Do List'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.format_list_bulleted)),
              Tab(icon: Icon(Icons.check)),
              // Tab(icon: Icon(Icons.close_rounded))
            ],
          )),
      body: TabBarView(
        children: [
          ListView(
            padding: EdgeInsets.only(top: 20.0),
            children: [Text('one')],
          ),
          ListView(
            padding: EdgeInsets.only(top: 20.0),
            children: [Text('two')],
          ),
          // ListView(
          //   padding: EdgeInsets.only(top: 20.0),
          //   children: [Text('three')],
          // ),
        ],
      ),
    );
  }
}
