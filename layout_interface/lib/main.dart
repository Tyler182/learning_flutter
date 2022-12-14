import 'package:flutter/material.dart';

void main() => runApp(_MyStatelessWidgetState());

class _MyStatelessWidgetState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.black54),
    leading: IconButton(
      icon:const Icon(
        Icons.menu,
      ),
      onPressed: () {},
    ),
    title: const Text(
      "Wheather2",
      style: TextStyle(color: Colors.black87),
    ),
    actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.settings),
        onPressed: () {},
      ),
    ],
    centerTitle: true,
  );
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        _headerImage(),
        SafeArea(
          minimum: const EdgeInsets.all(16),
          child: Column(
            children: [
              _wetherDay(),
              const Divider(
                thickness: 1,
              ),
              _wetherDescription(),
              const Divider(),
              _temperature(),
              const Divider(),
              _temperatureForecast(),
              const Divider(),
              _footerRatings(),
            ],
          ),
        )
      ],
    ),
  );
}

Widget _headerImage() {
  // Header Image Widget
  return Image.network(
    "https://coolsen.ru/wp-content/uploads/2021/01/image055-38.jpg",
    fit: BoxFit.cover,
  );
}

Widget _wetherDay() {
  // Day of week + Date WIdget
  return const Text(
    "Tuesday - May 22",
    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
  );
}

Widget _wetherDescription() {
  //Small text weather description widget
  return const Text(
    "The summer is usually hot. In June it is warm and rainy."
    "July is usually very hot, especially its second half."
    "The weather is sunny. The first days of August are often the hottest.",
    style: TextStyle(fontSize: 14, color: Colors.black54),
  );
}

Widget _temperature() {
  //Icon of weather + Temperature + Location Widget
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(Icons.sunny, color: Colors.yellow.shade600),
      const SizedBox(width: 20),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "15C Clear",
            style: TextStyle(
              color: Colors.purple.shade400,
            ),
          ),
          const Text("Murmanskay oblast, Murmansk",
              style: TextStyle(color: Colors.black54)),
        ],
      )
    ],
  );
}

Widget _temperatureForecast() {
  // Temperature Forecat for 7 days
  return Wrap(
    spacing: 10,
    children: <Widget>[
      _temperatureForecastDay(23),
      _temperatureForecastDay(24),
      _temperatureForecastDay(23),
      _temperatureForecastDay(24),
      _temperatureForecastDay(21),
      _temperatureForecastDay(28),
      _temperatureForecastDay(21),
      // _temperatureForecastDay(22),
    ],
  );
}

Chip _temperatureForecastDay(int temp) {
  //Chip widget for Temperature Forecast,
  //show static Icon and temperature of the day.
  return Chip(
    label: Text("${temp.toString()}C"),
    avatar: const Icon(
      Icons.cloud,
      color: Colors.blue,
    ),
    backgroundColor: Colors.grey.shade100,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    side: BorderSide(width: 1, color: Colors.grey.shade400),
  );
}

Widget _footerRatings() {
  //Footer  widget - what site info used + rating
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      const Text("Info with openweather.com"),
      Row(children: <Widget>[
        Icon(
          Icons.star,
          color: Colors.yellow.shade600,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow.shade600,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow.shade600,
        ),
        const Icon(Icons.star),
        const Icon(Icons.star),
      ]),
    ],
  );
}
