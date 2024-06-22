class CityModel {
  final String cityName;
  final double currentTemperature;
  final String weatherConditionText;
  final String weatherConditionIconUrl;
  final String windKmh;
  final int cloud;
  final String localTime;

  CityModel(
      {required this.cityName,
      required this.currentTemperature,
      required this.weatherConditionText,
      required this.weatherConditionIconUrl,
      required this.windKmh,
      required this.cloud,
      required this.localTime});

  static CityModel fromJson(Map<String, dynamic> data) {
    return CityModel(
        cityName: data['location']['name'],
        currentTemperature: double.tryParse(data['current']['temp_c']) ?? 0.0,
        weatherConditionText: data['current']['condition']['text'],
        weatherConditionIconUrl: data['current']['condition']['icon'],
        windKmh: data['current']['wind_kph'],
        cloud: int.tryParse(data['current']['cloud']) ?? 0,
        localTime: data['location']['localtime']);
  }
}
