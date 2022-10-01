import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SharedPrefereceExample(),
    );
  }
}

class SharedPrefereceExample extends StatefulWidget {
  @override
  _SharedPrefereceExampleState createState() => _SharedPrefereceExampleState();
}

class _SharedPrefereceExampleState extends State<SharedPrefereceExample> {
  static const keyIntPrefs = 'int';
  static const keyBoolPrefs = 'bool';

  late SharedPreferences prefs;
  late int _intPrefs;
  late bool _boolPrefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._intPrefs = 0;
    this._boolPrefs = false;
    SharedPreferences.getInstance().then((value) => prefs = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preference'),
      ),
      body: Column(
        children: <Widget>[
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: <TableRow>[
              TableRow(children: <Widget>[
                Text('Number Preference'),
                Text('${this._intPrefs}'),
                ElevatedButton(
                  child: Text('Increment'),
                  onPressed: () {
                    setIntPrefs(this._intPrefs += 1);
                  },
                ),
              ]),
              TableRow(children: <Widget>[
                Text('Boolean Preference'),
                Text('${this._boolPrefs}'),
                ElevatedButton(
                  child: Text('Toogle'),
                  onPressed: () {
                    setBoolPrefs(!this._boolPrefs);
                  },
                ),
              ]),
            ],
          ),
          ElevatedButton(
            child: Text('Reset Data'),
            onPressed: () {
              resetPrefs();
            },
          ),
        ],
      ),
    );
  }

  Future<Null> setIntPrefs(value) async {
    await this.prefs.setInt(keyIntPrefs, value);
    setState(() {
      this._intPrefs = value;
    });
  }

  int readIntPrefs() {
    return this.prefs.getInt(keyIntPrefs) ?? 0;
  }

  Future<Null> setBoolPrefs(value) async {
    await this.prefs.setBool(keyBoolPrefs, value);
    setState(() {
      this._boolPrefs = value;
    });
  }

  bool readBoolPrefs() {
    return this.prefs.getBool(keyBoolPrefs) ?? false;
  }

  Future<Null> resetPrefs() async {
    await this.prefs.remove(keyIntPrefs);
    await this.prefs.remove(keyBoolPrefs);
    setState(() {
      this._intPrefs = readIntPrefs();
      this._boolPrefs = readBoolPrefs();
    });
  }
}
