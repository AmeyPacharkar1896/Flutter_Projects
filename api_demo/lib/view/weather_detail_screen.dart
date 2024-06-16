import 'package:api_demo/api_details.dart/api_key.dart';
import 'package:api_demo/view/widget/empty_weather_widget.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

part 'widget/weather_detail_widget.dart';

class WeatherDetailScreen extends StatefulWidget {
  const WeatherDetailScreen({super.key});

  @override
  State<WeatherDetailScreen> createState() => _WeatherDetailScreenState();
}

class _WeatherDetailScreenState extends State<WeatherDetailScreen> {
  final WeatherFactory wf = WeatherFactory(apikey);
  Weather? weather;

  @override
  void initState() {
    super.initState();
    wf.currentWeatherByCityName('Mumbai').then((value) => {
          setState(() {
            weather = value;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(
          child: Text(
            'Weather Details',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    (weather == null) : EmptyWeatherWidget() ? EmptyWeatherWidget();
                    if (weather == null) {
                      EmptyWeatherWidget();
                    } else {
                      C;
                      
                    }
                  });
                },
                child: const Text('Current Temperture'))
          ],
        ),
      ),
    );
  }
}



// showDialog(
//                       context: context, 
//                       builder: ((context) {
//                       Dialog(
                      // child: Text(
                      //   _weather?.areaName ?? 'No weather to show',
                      //   style: const TextStyle(
                      //     fontSize: 20,
                      //     fontWeight: FontWeight.w300,
                      //   ),
                      // ),
//                     );
//                     }));