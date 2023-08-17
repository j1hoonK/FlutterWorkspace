import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key, this.parseWeatherData});

  final parseWeatherData;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late String cityName;
  late double temp;
  var date = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.parseWeatherData);
  }

  void updateData(dynamic weatherData) {
    cityName = weatherData['name'];
    print('cityName: $cityName');
    temp = weatherData['main']['temp'];
    print('Temperature: $temp');
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
        // title: Text(''),
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
                            Text('18\u2103',
                                style: GoogleFonts.lato(
                                    fontSize: 85,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white)),
                            Row(
                              children: [
                                SvgPicture.asset('svg/climacon-sun.svg'),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Clear Sky',
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
                              Image.asset(
                                'image/bad.png',
                                width: 37,
                                height: 35,
                              ),
                              SizedBox(height: 10,),
                              Text('"매우나쁨',
                                  style: GoogleFonts.lato(
                                      fontSize: 14, color: Colors.black87, fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Column(
                            children: [
                              Text('AQI(대기질지수)',
                                  style: GoogleFonts.lato(
                                      fontSize: 14, color: Colors.white)),
                              SizedBox(height: 10,),
                              Image.asset(
                                'image/bad.png',
                                width: 37,
                                height: 35,
                              ),
                              SizedBox(height: 10,),
                              Text('"매우나쁨',
                                style: GoogleFonts.lato(
                                    fontSize: 14, color: Colors.black87, fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Column(
                            children: [
                              Text('AQI(대기질지수)',
                                  style: GoogleFonts.lato(
                                      fontSize: 14, color: Colors.white)),
                              SizedBox(height: 10,),
                              Image.asset(
                                'image/bad.png',
                                width: 37,
                                height: 35,
                              ),
                              SizedBox(height: 10,),
                              Text('"매우나쁨',
                                style: GoogleFonts.lato(
                                    fontSize: 14, color: Colors.black87, fontWeight: FontWeight.bold),),
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
