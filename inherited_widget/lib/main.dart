import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  int get counter {
    return _counter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: MyInheritedWidget(
        child: RootWidget(),
        state: this
      ),
    );
  }
}

class RootWidget extends StatelessWidget {
  RootWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rootstate = MyInheritedWidget.of(context).state;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '${rootstate.counter}',
            style: Theme.of(context).textTheme.headline4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ChildWidget(),
              ChildWidget(),
            ],
          )
        ],
      ),
    );
  }
}

class ChildWidget extends StatelessWidget {
  const ChildWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final childstate = MyInheritedWidget.of(context).state;

    return FloatingActionButton(
      onPressed: () => {childstate._incrementCounter()},
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}

class MyInheritedWidget extends InheritedWidget {

  const MyInheritedWidget({
    Key? key,
    required this.state,
    required Widget child,
  }) : super(key: key, child: child);

  final _MyHomePageState state;

  static MyInheritedWidget of(BuildContext context) {
    final MyInheritedWidget? result = context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
    assert(result != null, 'No FrogColor found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(MyInheritedWidget old) => state != old.state;
}
