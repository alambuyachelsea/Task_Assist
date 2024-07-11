import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Assist',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ShoppingPage(),
    WorkPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Assist'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Shopping',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cases),
            label: 'Work',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _items = [];
  final TextEditingController _controller = TextEditingController();

  void _addItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Home Task'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: "Enter task name"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                _controller.clear();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                setState(() {
                  _items.add(CheckboxListTile(
                    title: Text(_controller.text),
                    value: false,
                    onChanged: (bool? value) {},
                  ));
                });
                _controller.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: ListView(
            children: _items,
          ),
        ),
        ElevatedButton(
          onPressed: _addItem,
          child: Text('Add Home Task'),
        ),
      ],
    );
  }
}

class ShoppingPage extends StatefulWidget {
  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  final List<Widget> _items = [];
  final TextEditingController _controller = TextEditingController();

  void _addItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Shopping Task'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: "Enter task name"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                _controller.clear();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                setState(() {
                  _items.add(CheckboxListTile(
                    title: Text(_controller.text),
                    value: false,
                    onChanged: (bool? value) {},
                  ));
                });
                _controller.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: ListView(
            children: _items,
          ),
        ),
        ElevatedButton(
          onPressed: _addItem,
          child: Text('Add Shopping Task'),
        ),
      ],
    );
  }
}

class WorkPage extends StatefulWidget {
  @override
  _WorkPageState createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  final List<Widget> _items = [];
  final TextEditingController _controller = TextEditingController();

  void _addItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Work Task'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: "Enter task name"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                _controller.clear();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                setState(() {
                  _items.add(CheckboxListTile(
                    title: Text(_controller.text),
                    value: false,
                    onChanged: (bool? value) {},
                  ));
                });
                _controller.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: ListView(
            children: _items,
          ),
        ),
        ElevatedButton(
          onPressed: _addItem,
          child: Text('Add Work Task'),
        ),
      ],
    );
  }
}
