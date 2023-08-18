import 'package:flutter/material.dart';

class WeatherScrean extends StatefulWidget {
  const WeatherScrean({super.key, this.parseWeatherData});
  final parseWeatherData;

  @override
  State<WeatherScrean> createState() => _WeatherScreanState();
}

class _WeatherScreanState extends State<WeatherScrean> {

  String? cityName;
  int? temp;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var parseW = widget.parseWeatherData;
    updateData(parseW);
  }

  void updateData(dynamic weatherData){
    double temp2 = weatherData['main']['temp'];
    temp = temp2.round();
    cityName = weatherData['name'];
    
    print('temp: $temp도');
    print('cityName: $cityName');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$cityName',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '$temp˚',
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      )),
    );
  }
}
