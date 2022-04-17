import 'package:flutterclean/data/api/repository/day_data_repository.dart';
import 'package:flutterclean/domain/repository/day_repository.dart';
import 'package:flutterclean/internal/dependencies/api_module.dart';

class RepositoryModule{
  static DayRepository? _dayRepository;

  static DayRepository dayRepository(){
   if(_dayRepository == null) {
     DayDataRepository(ApiModule.apiUtil());
   }
     return _dayRepository!;
  }
}