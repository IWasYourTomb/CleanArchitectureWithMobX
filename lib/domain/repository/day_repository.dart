import 'package:meta/meta.dart';
import 'package:flutterclean/domain/model/day.dart';

abstract class DayRepository{
  Future<Day> getDay({
  required double latitude,
    required double longitude,
});
}