import 'dart:io';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local file read/write Demo',
      home: ReadWriteFileExample(),
    );
  }
}

class ReadWriteFileExample extends StatefulWidget {
  @override
  _ReadWriteFileExampleState createState() => _ReadWriteFileExampleState();
}

class _ReadWriteFileExampleState extends State<ReadWriteFileExample> {
  final TextEditingController _textController = TextEditingController();
  final fileName = 'filename.txt';
  String _filePath = '';
  String _content = '';

  @override
  void initState() {
    super.initState();
    this.readFromFile();
    this._localFile.then((value) {
      setState(() {
         this._filePath = value.path;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    FocusNode textFieldFocusNode = FocusNode();
    return Scaffold(
      appBar: AppBar(
        title: Text('Local file read/write Demo'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          Text('Write to local file:', style: TextStyle(fontSize: 20)),
          TextField(
              focusNode: textFieldFocusNode,
              controller: _textController,
              maxLines: null,
              style: TextStyle(fontSize: 20)),
          ButtonBar(
            children: <Widget>[
              MaterialButton(
                child: Text('Load', style: TextStyle(fontSize: 20)),
                onPressed: () async {
                  await this.readFromFile();
                  log('Data successfully loaded');
                  _textController.text = this._content;
                  textFieldFocusNode.requestFocus();
                },
              ),
              MaterialButton(
                child: Text('Save', style: TextStyle(fontSize: 20)),
                onPressed: () async {
                  await this.writeToFile(_textController.text);
                  await this.readFromFile();
                  log('Data successfully saved');
                  _textController.clear();
                  textFieldFocusNode.requestFocus();
                },
              ),
            ],
          ),
          Divider(height: 20.0),
          Text('Local file path:',
              style: Theme.of(context).textTheme.headline6),
          Text(this._filePath,
              style: Theme.of(context).textTheme.subtitle1),
          Divider(height: 20.0),
          Text('Local file content:',
              style: Theme.of(context).textTheme.headline6),
          Text(_content, style: Theme.of(context).textTheme.subtitle1),
        ],
      ),
    );
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;

    return File('$path/${this.fileName}');
  }

  Future<File> writeToFile(String message) async {
    final file = await _localFile;

    return file.writeAsString(message);
  }

  readFromFile() async {
    late String content;

    try {
      final file = await _localFile;
      content = await file.readAsString();
    } catch (e) {
      content = e.toString();
    }
    setState(() {
      this._content = content;
    });
  }
}
