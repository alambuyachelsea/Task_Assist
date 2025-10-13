import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Assist',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF004EA6)),
      ),
      home: const TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<String> todoItems = [];
  List<bool> todoCompleted = [];
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTodos(); // Load saved tasks on app start
  }

  // Load tasks from SharedPreferences
  Future<void> _loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTasks = prefs.getString('todoItems');
    final savedStatus = prefs.getString('todoCompleted');

    if (savedTasks != null && savedStatus != null) {
      setState(() {
        todoItems = List<String>.from(jsonDecode(savedTasks));
        todoCompleted = List<bool>.from(jsonDecode(savedStatus));
      });
    }
  }

  // Save tasks to SharedPreferences
  Future<void> _saveTodos() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('todoItems', jsonEncode(todoItems));
    await prefs.setString('todoCompleted', jsonEncode(todoCompleted));
  }

  void addTodoItem() {
    if (textController.text.isNotEmpty) {
      setState(() {
        todoItems.add(textController.text);
        todoCompleted.add(false);
        textController.clear();
      });
      _saveTodos();
    }
  }

  void editTodoItem(int index) {
    setState(() {
      textController.text = todoItems[index];
      todoItems.removeAt(index);
      todoCompleted.removeAt(index);
    });
    _saveTodos();
  }

  void deleteTodoItem(int index) {
    setState(() {
      todoItems.removeAt(index);
      todoCompleted.removeAt(index);
    });
    _saveTodos();
  }

  void toggleTodoCompleted(int index) {
    setState(() {
      todoCompleted[index] = !todoCompleted[index];
    });
    _saveTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        backgroundColor: const Color(0xFF004EA6),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      hintText: 'Enter a task...',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => addTodoItem(),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(Color(0xFFFFC8FF)),
                  ),
                  onPressed: addTodoItem,
                  child: const Text('Add'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: todoItems.isEmpty
                  ? Center(
                child: Text(
                  'No tasks yet!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              )
                  : ListView.builder(
                itemCount: todoItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      leading: Checkbox(
                        value: todoCompleted[index],
                        onChanged: (bool? value) {
                          toggleTodoCompleted(index);
                        },
                      ),
                      title: GestureDetector(
                        onTap: () => editTodoItem(index),
                        child: Text(
                          todoItems[index],
                          style: TextStyle(
                            fontSize: 16,
                            decoration: todoCompleted[index]
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            color: todoCompleted[index]
                                ? Colors.grey
                                : Colors.black,
                          ),
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => deleteTodoItem(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
