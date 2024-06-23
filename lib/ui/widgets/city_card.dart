import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/domain/models/city_model.dart';
import 'package:weather_app/ui/city_page.dart';

class CityCard extends StatelessWidget {
  final CityModel city;
  const CityCard({required this.city, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CityPage(city: city)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: ListTile(
            title: Text(city.cityName,
                style: Theme.of(context).textTheme.displayLarge),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${city.currentTemperature.round()}°С',
                    style: Theme.of(context).textTheme.displayMedium),
                Text(city.weatherConditionText,
                    style: Theme.of(context).textTheme.displayMedium)
              ],
            ),
            trailing: Image.network(
              city.weatherConditionIconUrl,
              fit: BoxFit.fill,
              // width: MediaQuery.of(context).size.width * 0.15,
              // height: MediaQuery.of(context).size.width * 0.15),
            )),
      ),
    );
  }
}
