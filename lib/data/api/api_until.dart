import 'package:flutterclean/data/api/request/get_day_body.dart';
import 'package:flutterclean/data/api/service/sunset_service.dart';
import 'package:flutterclean/data/mapper/day_mapper.dart';
import 'package:flutterclean/domain/model/day.dart';

class ApiUtil{
  final SunsetService _sunsetService;

  ApiUtil(this._sunsetService);

  Future<Day> getDay({
    required double latitude,
    required double longitude
}) async{
    final body = GetDayBody(latitude: latitude, longitude: longitude);
    final result = await _sunsetService.getDay(body);
    return DayMapper.fromApi(result);
  }
}