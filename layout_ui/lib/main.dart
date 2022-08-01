import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white70,
              // displayColor: Colors.white,
            ),
      ),
      home: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
    elevation: 0,
    title: const Text('Weather Forecast'),
    backgroundColor: Colors.red,
    centerTitle: true,
  );
}

Widget _buildBody() {
  return SafeArea(
    child: Container(
      color: Colors.red,
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _searchField(),
          const SizedBox(height: 20),
          _cityDetail(),
          const SizedBox(height: 50),
          _temperatureDetail(),
          const SizedBox(height: 50),
          _extraWeatherDetail(),
          const SizedBox(height: 50),
          _bottomText(),
          const SizedBox(height: 6),
          _bottomDetail(),
        ],
      ),
    ),
  );
}

TextField _searchField() {
  return const TextField(
    decoration: InputDecoration(
      border: InputBorder.none,
      labelText: 'Enter City Name',
      labelStyle: TextStyle(color: Colors.white),
      icon: Icon(
        Icons.search,
        size: 30,
        color: Colors.white,
      ),
    ),
  );
}

Widget _cityDetail() {
  // ignore: prefer_const_literals_to_create_immutables
  return Column(children: <Widget>[
    const Text(
      'Moscow, RU',
      style: TextStyle(
        fontSize: 36,
      ),
    ),
    const SizedBox(height: 10),
    const Text(
      'Friday, Mar 20, 2020',
      style: TextStyle(
        fontSize: 18,
      ),
    ),
  ]);
}

Widget _temperatureDetail() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Icon(
        Icons.wb_sunny,
        color: Colors.white,
        size: 80,
      ),
      Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            const Text(
              "14' F",
              style: TextStyle(
                fontSize: 50,
              ),
            ),
            const Text(
              'LIGHT SNOW',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ]),
    ],
  );
}

Widget _extraWeatherDetail() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Column(
        children: const <Widget>[
          Icon(Icons.ac_unit, color: Colors.white, size: 32),
          Text(
            '5',
            style: TextStyle(fontSize: 22),
          ),
          Text('km/h'),
        ],
      ),
      Column(
        children: const <Widget>[
          Icon(Icons.ac_unit, color: Colors.white, size: 32),
          Text(
            '3',
            style: TextStyle(fontSize: 22),
          ),
          Text('%'),
        ],
      ),
      Column(
        children: const <Widget>[
          Icon(Icons.ac_unit, color: Colors.white, size: 32),
          Text(
            '20',
            style: TextStyle(fontSize: 22),
          ),
          Text('%'),
        ],
      ),
    ],
  );
}

Widget _bottomText() {
  return const Text(
    '7-DAY WEATHER FORECAST',
    style: TextStyle(fontSize: 18),
  );
}

Widget _bottomDetail() {
  return Container(
    height: 100,
    child: ListView.builder(
      itemCount: 7,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Row(
          children: <Widget>[
            Container(
              width: 150,
              child: _bottomDetailItem(context,
                  index), //_bottomDetailItem Return Widget with Day of week, temperature an Icon of weather
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        );
      },
    ),
  );
}

_bottomDetailItem(context, index) {
  // index - index of the day, 0 - Friday
  // Return Widget with Day of week, temperature an Icon of weather
  String day = "Friday"; // day of week
  switch (index) {
    case 0:
      {
        day = "Friday";
        break;
      }
    case 1:
      {
        day = "Saturday";
        break;
      }
    case 2:
      {
        day = "Sunday";
        break;
      }
    case 3:
      {
        day = "Monday";
        break;
      }
    case 4:
      {
        day = "Tuesday";
        break;
      }
    case 5:
      {
        day = "Wednesday";
        break;
      }
    case 6:
      {
        day = "Thursday";
        break;
      }
  }
  return Container(
    alignment: Alignment.center,
    color: Colors.red.shade400,
    child: Column(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // ignore: prefer_const_constructors
        Text(day, style: TextStyle(fontSize: 26)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Text(
              "6 'F",
              style: TextStyle(fontSize: 26),
            ),
            SizedBox(
              width: 6,
            ),
            Icon(
              Icons.wb_sunny,
              color: Colors.white,
              size: 36,
            ),
          ],
        ),
      ],
    ),
  );
}
