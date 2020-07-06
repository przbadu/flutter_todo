import 'package:flutter/material.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      home: TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<String> _todoItems = [];

  // This will be called each time + is pressed
  void _addTodoItem() {
    // putting our code inside `setState()` tells the app that our state has
    // changed, and it will automatically re-render the list
    setState(() {
      int index = _todoItems.length;
      _todoItems.add('Item ' + index.toString());
    });
  }

  // Build the whole list of todo items
  Widget _buildTodoList() {
    return ListView.builder(itemBuilder: (context, index) {
      // itemBuilder will be called automatically as many time as it takes for
      // the list to fill up its available space, which is most likely more
      // than the number of todo items we have. So, we need to check the index
      // is OK.
      if (index < _todoItems.length) {
        return _buildTodoItem(_todoItems[index]);
      }
      return null;
    });
  }

  // build a single todo item
  Widget _buildTodoItem(String todoText) {
    return ListTile(
      title: Text(todoText),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: _buildTodoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodoItem,
        tooltip: 'Add Task',
        child: Icon(Icons.add),
      ),
    );
  }
}
