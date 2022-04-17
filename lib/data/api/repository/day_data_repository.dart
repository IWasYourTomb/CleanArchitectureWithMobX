import 'package:flutterclean/data/api/api_until.dart';
import 'package:flutterclean/domain/model/day.dart';
import 'package:flutterclean/domain/repository/day_repository.dart';

class DayDataRepository extends DayRepository{
  final ApiUtil _apiUntil;
  DayDataRepository(this._apiUntil);

  @override
  Future<Day> getDay({required double latitude, required double longitude}) {
    return _apiUntil.getDay(latitude: latitude, longitude: longitude);
  }
}