import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:network_json/offices.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Network JSON',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final Future<OfficeList> officeList;

  @override
  void initState() {
    super.initState();
    officeList = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Network JSON')),
      body: FutureBuilder<OfficeList>(
        future: officeList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.officeList.length,
              itemBuilder: (context, i) {
                return Card(
                  child: ListTile(
                    title: Text(snapshot.data?.officeList[i].name ?? ''),
                    subtitle: Text(snapshot.data?.officeList[i].address ?? ''),
                    leading: Image.network(snapshot.data?.officeList[i].image ?? ''),
                  ),
                );
              },
            );
          };
          return Container();
        },
      ),
    );
  }
}

Future<OfficeList> getData() async {
  String url = 'https://about.google/static/data/locations.json';
  http.Response response = await http.get(Uri.parse(url));
  return OfficeList.fromJson(jsonDecode(response.body));
}

// void loadData() {
//   try {
//     getData().then((response) {
//       if (response.statusCode == 200) {
//         print(OfficeList.fromJson(jsonDecode(response.body)));
//       } else {
//         print(response.statusCode);
//       }
//     });
//   } catch (e) {
//     print(e);
//   }
// }
