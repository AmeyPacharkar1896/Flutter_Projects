part of '../weather_detail_screen.dart';

class WeatherDetailsWidget extends StatelessWidget {
  WeatherDetailsWidget({super.key, required this.weather});

  Weather? weather;

  @override
  Widget build(BuildContext context) {
    var temp = weather?.temperature;
    return Dialog(
      child: Column(
        children: [
          Text(
            weather?.areaName ?? 'No weather to show',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            temp!.celsius.toString(),
          ),
        ],
      ),
    );
  }
}
