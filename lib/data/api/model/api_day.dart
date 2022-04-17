class ApiDay{
  final String? sunrise;
  final String? sunset;
  final String? solarNoon;
  final num dayLength;

  ApiDay.fromApi(Map<String, dynamic> map)
      : sunrise = map['result']['sunrise'],
        sunset = map['result']['sunset'],
        solarNoon = map['result']['solarNoon'],
        dayLength = map['result']['dayLength'];
}