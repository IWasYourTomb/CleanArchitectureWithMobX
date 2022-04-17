import 'package:flutterclean/data/api/api_until.dart';
import 'package:flutterclean/data/api/service/sunset_service.dart';

class ApiModule{
  static ApiUtil? _apiUntil;

  static ApiUtil apiUtil(){
   if( _apiUntil == null) {
     ApiUtil(SunsetService());
   }
     return _apiUntil!;
  }
}