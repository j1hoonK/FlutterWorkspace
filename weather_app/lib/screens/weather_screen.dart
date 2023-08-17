import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/model.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key, this.parseWeatherData, this.parseAirPollution});

  final parseWeatherData;
  final parseAirPollution;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Model model = Model();
  late Widget icon;
  late String cityName;
  late String weather;
  //late int condition;
  var temp;
  var date = DateTime.now();
  late Widget airIcon;
  late Widget airState;
  late double dust1;
  late double dust2;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.parseWeatherData, widget.parseAirPollution);
  }

  void updateData(dynamic weatherData, dynamic airPollution) {
    cityName = weatherData['name'];
    double temp2 = weatherData['main']['temp'];
    temp = temp2.toStringAsFixed(1);
    weather = weatherData['weather'][0]['description'];
    int condition = weatherData['weather'][0]['id'];
    icon = model.getWeatherIcon(condition)!;
    int index = airPollution['list'][0]['main']['aqi'];
    airIcon = model.getAirIcon(index)!;
    airState = model.getAirCondition(index)!;
    dust1 = airPollution['list'][0]['components']['pm10'];
    dust2 = airPollution['list'][0]['components']['pm2_5'];
  }

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat("h:mm: a").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.near_me),
          iconSize: 30,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.location_searching),
            iconSize: 30,
          )
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'image/background.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 150,
                            ),
                            Text('$cityName',
                                style: GoogleFonts.lato(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            Row(
                              children: [
                                TimerBuilder.periodic(Duration(minutes: 1),
                                    builder: (context) {
                                  print(getSystemTime());
                                  return Text(
                                    getSystemTime(),
                                    style: GoogleFonts.lato(
                                        fontSize: 16, color: Colors.white),
                                  );
                                }),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  DateFormat(' - EEEE, ').format(date),
                                  style: GoogleFonts.lato(
                                      fontSize: 16, color: Colors.white),
                                ),
                                Text(
                                  DateFormat('d MMM, yyy').format(date),
                                  style: GoogleFonts.lato(
                                      fontSize: 16, color: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('$temp\u2103',
                                style: GoogleFonts.lato(
                                    fontSize: 85,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white)),
                            Row(
                              children: [
                                icon,
                                SizedBox(
                                  width: 10,
                                ),
                                Text('$weather',
                                    style: GoogleFonts.lato(
                                        fontSize: 16, color: Colors.white))
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Divider(
                        height: 15,
                        thickness: 2,
                        color: Colors.white30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text('AQI(대기질지수)',
                                  style: GoogleFonts.lato(
                                      fontSize: 14, color: Colors.white)),
                              SizedBox(height: 10,),
                              airIcon,
                              SizedBox(height: 10,),
                              airState,
                            ],
                          ),
                          Column(
                            children: [
                              Text('미세먼지',
                                  style: GoogleFonts.lato(
                                      fontSize: 14, color: Colors.white)),
                              SizedBox(height: 10,),
                              Text('$dust1',
                                  style: GoogleFonts.lato(
                                      fontSize: 24, color: Colors.white)),
                              SizedBox(height: 10,),
                              Text('㎍/m³',
                                style: GoogleFonts.lato(
                                    fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Column(
                            children: [
                              Text('초미세먼지',
                                  style: GoogleFonts.lato(
                                      fontSize: 14, color: Colors.white)),
                              SizedBox(height: 10,),
                              Text('$dust2',
                                  style: GoogleFonts.lato(
                                      fontSize: 24, color: Colors.white)),
                              SizedBox(height: 10,),
                              Text('㎍/m³',
                                style: GoogleFonts.lato(
                                    fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
