import 'package:flutter/material.dart';
import 'package:practice/data/my_location.dart';
import 'package:practice/data/network.dart';
import 'package:practice/screens/weather_screen.dart';

const apiKey = '3072f7c6269e2d34a16bd8d3fb863e20';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double? latitude3;
  double? longitude3;

  void initState() {
    super.initState();
    getLocation();
    // fetchData();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();

    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    print('lat: $latitude3');
    print('long: $longitude3');

    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apiKey&units=metric');

    var weatherData = await network.getJsonData();
    print('weatherData: $weatherData');
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WeatherScrean(parseWeatherData: weatherData,),
        ));
  }

/*  void fetchData() async {
      var myJson = parsingData['wind']['speed'];
      print(myJson);
      var myJson2 = parsingData['id'];
      print(myJson2);
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: null,
          child: Text(
            'Get My Location',
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colors.greenAccent[700])),
        ),
      ),
    );
  }
}
