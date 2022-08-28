import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScopedModel Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'ScopedModel Demo'),
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
  final model = CounterModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<CounterModel>(
        model: model,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('ScopedModel Widget'),
            centerTitle: true,
          ),
          body: ListView(
            children: <Widget>[
              _AppRootWidget(),
            ],
          ),
        ));
  }
}

class _AppRootWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Column(
        children: <Widget>[
          Text('(Root Widget)', style: Theme.of(context).textTheme.headline4),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _Counter(),
              _Counter(),
            ],
          ),
        ],
      ),
    );
  }
}

class _Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4.0).copyWith(bottom: 32.0),
      color: Colors.yellowAccent,
      child: ScopedModelDescendant<CounterModel>(
        builder: (context, child, model) {
          return Column(
            children: <Widget>[
              const Text('(Child Widget)'),
              Text(
                '${model.counter}',
                style: Theme.of(context).textTheme.headline4,
              ),
              ButtonBar(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.remove),
                    color: Colors.red,
                    onPressed: () {
                      model.decrement();
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    color: Colors.green,
                    onPressed: () {
                      model.increment();
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class CounterModel extends Model {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter+=1;
    notifyListeners();
  }

  void decrement() {
    _counter-=1;
    notifyListeners();
  }
}
