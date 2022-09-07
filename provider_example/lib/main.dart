import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CountProvider()),
        FutureProvider<List<User>>(
          create: (context) => UserProvider().loadUserData(),
          initialData: [],
        ),
      ],
      child: MaterialApp(
        title: 'Inherited Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DefaultTabController(
          length: 3,
          child: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                title: const Text("Provider Demo"),
                centerTitle: true,
                bottom: const TabBar(
                  tabs: <Widget>[
                    Tab(icon: Icon(Icons.add)),
                    Tab(icon: Icon(Icons.person)),
                    Tab(icon: Icon(Icons.message)),
                  ],
                ),
              ),
              body: const TabBarView(
                children: <Widget>[
                  MyCountPage(),
                  MyUserPage(),
                  MyEventPage(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyCountPage extends StatelessWidget {
  const MyCountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('ChangeNotifierProvider Example',
                style: TextStyle(fontSize: 20)),
            const SizedBox(height: 50),
            Consumer<CountProvider>(builder: (context, value, child) {
              return Text('${value.counterValue}',
                  style: Theme.of(context).textTheme.headline4);
            }),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<CountProvider>(builder: (context, value, child) {
                  return IconButton(
                    icon: const Icon(Icons.remove),
                    color: Colors.red,
                    onPressed: () {
                      value._decrementCount();
                    },
                  );
                }),
                Consumer<CountProvider>(builder: (context, value, child) {
                  return IconButton(
                    icon: const Icon(Icons.add),
                    color: Colors.green,
                    onPressed: () {
                      value._incrementCount();
                    },
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyUserPage extends StatelessWidget {
  const MyUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text('FutureProvider Example, users loaded from a File',
              style: TextStyle(fontSize: 17)),
        ),
        Consumer<List<User>>(
          builder: (context, value, child) {
            return value.isEmpty
                ? Column(children: <Widget>[
                    SizedBox(height: 100),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: CircularProgressIndicator(
                        value: 0.4,
                        strokeWidth: 10,
                      ),
                    ),
                  ])
                : Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 50,
                          color: Colors.grey[(index * 200) % 400],
                          child: Center(
                            child: Text(
                                '${value[index].firstName} ${value[index].lastName} | ${value[index].website}'),
                          ),
                        );
                      },
                    ),
                  );
          },
        )
      ],
    );
  }
}

// Event page (counting)
class MyEventPage extends StatelessWidget {
  const MyEventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('StreamProvider Example', style: TextStyle(fontSize: 20)),
        const SizedBox(height: 50),
        Text('0', style: Theme.of(context).textTheme.headline4)
      ],
    ));
  }
}

// CountProvider (ChangeNotifier)
class CountProvider extends ChangeNotifier {
  int _count = 0;
  int get counterValue => _count;

  void _incrementCount() {
    _count++;
    notifyListeners();
  }

  void _decrementCount() {
    _count--;
    notifyListeners();
  }
}

// UserProvider (Future)
class UserProvider {
  final String _dataPath = "assets/users.json";
  List<User> users = [];

  Future<String> loadAsset() async {
    return await Future.delayed(const Duration(seconds: 2), () async {
      return await rootBundle.loadString(_dataPath);
    });
  }

  Future<List<User>> loadUserData() async {
    var dataString = await loadAsset();
    Map<String, dynamic> jsonUserData = jsonDecode(dataString);
    users = UserList.fromJson(jsonUserData['users']).users;
    return users;
  }
}

// EventProvider (Stream)
class EventProvider {
  Stream<int> intStream() {
    Duration interval = const Duration(seconds: 2);
    return Stream<int>.periodic(interval, (int count) => count++);
  }
}

// User Model
class User {
  final String firstName, lastName, website;
  const User(this.firstName, this.lastName, this.website);

  User.fromJson(Map<String, dynamic> json)
      : firstName = json['first_name'],
        lastName = json['last_name'],
        website = json['website'];
}

// User List Model
class UserList {
  final List<User> users;
  UserList(this.users);

  UserList.fromJson(List<dynamic> usersJson)
      : users = usersJson.map((user) => User.fromJson(user)).toList();
}
