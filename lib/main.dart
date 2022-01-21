import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Weather Forecast'),
            centerTitle: true,
            backgroundColor: Colors.red,
            elevation: 0,
          ),
          backgroundColor: Colors.red,
          body: Column(
            children: [
              _searchBar(),
              const Divider(),
              _cityAndDate(),
              const SizedBox(height: 50),
              _todaysWeather(),
              const SizedBox(height: 50),
              _unknownWidget(),
              const SizedBox(height: 50),
              const Text('7-DAY WEATHER FORECAST',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w300)),
              const Divider(),
              const WeatherForecast()
            ],
          )),
    );
  }
}

Row _searchBar() {
  return Row(
    children: const [
      Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
      Text(
        'Enter City Name',
        style: TextStyle(color: Colors.white),
      ),
    ],
  );
}

Column _cityAndDate() {
  return Column(
    children: const [
      Text(
        'Dnepropetrovsk, UA',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      ),
      Divider(),
      Text(
        'Friday, Mar 20, 2020',
        style: TextStyle(color: Colors.white),
      ),
    ],
  );
}

Row _todaysWeather() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Padding(
        padding: EdgeInsets.only(right: 10),
        child: Icon(
          Icons.wb_sunny,
          size: 75,
          color: Colors.white,
        ),
      ),
      Column(
        children: [
          const Text(
            '14 °F',
            style: TextStyle(
                color: Colors.white, fontSize: 50, fontWeight: FontWeight.w100),
          ),
          Text(
            'light snow'.toUpperCase(),
            style: const TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),
          ),
        ],
      )
    ],
  );
}

Row _unknownWidget() {
  const _icon = Icon(
    Icons.ac_unit,
    color: Colors.white,
  );
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        children: const [
          _icon,
          Text('5', style: TextStyle(color: Colors.white)),
          Text('km/hr', style: TextStyle(color: Colors.white))
        ],
      ),
      Column(
        children: const [
          _icon,
          Text('3', style: TextStyle(color: Colors.white)),
          Text('%', style: TextStyle(color: Colors.white))
        ],
      ),
      Column(
        children: const [
          _icon,
          Text('20', style: TextStyle(color: Colors.white)),
          Text('%', style: TextStyle(color: Colors.white))
        ],
      ),
    ],
  );
}

class WeatherForecast extends StatelessWidget {
  const WeatherForecast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _weatherListView();
  }
}

Widget _weatherListView() {
  Container _generateCard(String day) {
    return Container(
        color: Colors.white30,
        margin: const EdgeInsets.only(left: 5, right: 5),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(day, style: const TextStyle(color: Colors.white, fontSize: 20)),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("${Random().nextInt(10)} °F",
                style: const TextStyle(color: Colors.white, fontSize: 20)),
            const Padding(
                padding: EdgeInsets.only(left: 5),
                child: Icon(Icons.wb_sunny, color: Colors.white, size: 30))
          ])
        ]));
  }

  return SizedBox(
      height: 100,
      width: 375,
      child: ListView(
          scrollDirection: Axis.horizontal,
          itemExtent: 160,
          children: [
            _generateCard('Sunday'),
            _generateCard('Monday'),
            _generateCard('Tuesday'),
            _generateCard('Wednesday'),
            _generateCard('Thursday'),
            _generateCard('Friday'),
            _generateCard('Satursday')
          ]));
}
