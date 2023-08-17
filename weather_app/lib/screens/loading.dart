import 'package:flutter/material.dart';
import 'package:weather_app/data/my_location.dart';
import 'package:weather_app/data/network.dart';
import 'package:weather_app/screens/weather_screen.dart';

const apiKey = '3072f7c6269e2d34a16bd8d3fb863e20';
double? latitude3;
double? longitude3;

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double? latitude3;
  double? longitude3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    print('latitude3 = $latitude3');
    print('longitude3 = $longitude3');

    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apiKey&units=metric');
    var weatherData = await network.getJsonData();
    print('WeatherData: $weatherData');

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WeatherScreen(parseWeatherData: weatherData),
        ));
  }

  /*void fetchData() async {
    var myJson = parsingData['weather'][0]['description'];
    var windSpeed = parsingData['wind']['speed'];
    var windDeg = parsingData['wind']['deg'];
    print('myJson: $myJson');
    print('windSpeed: $windSpeed');
    print('windDeg: $windDeg');
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //getLocation();
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue)),
          child: Text('Get my Location'),
        ),
      ),
    );
  }
}
