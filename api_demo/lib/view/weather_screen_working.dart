import 'package:api_demo/api_details.dart/api_key.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class WeatherScreenWorking extends StatefulWidget {
  const WeatherScreenWorking({super.key});

  @override
  State<WeatherScreenWorking> createState() => _WeatherScreenWorkingState();
}

class _WeatherScreenWorkingState extends State<WeatherScreenWorking> {
  final WeatherFactory wf = WeatherFactory(apikey);
  Weather? _weather;

  @override
  void initState() {
    super.initState();
    wf.currentWeatherByCityName('Mumbai').then((value) => {
          setState(() {
            _weather = value;
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
      body: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Column(
        children: [
          _locationHeader(),
          _temperatureInfo(),
        ],
      ),
    );
  }

  Widget _locationHeader() {
    return Text(
      _weather?.areaName ?? '',
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget _temperatureInfo() {
    var temp = _weather!.temperature;
    return Column(
      children: [
        Text(
          temp!.celsius.toString(),
        ),
      ],
    );
  }
}
