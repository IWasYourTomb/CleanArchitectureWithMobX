import 'package:flutterclean/domain/model/day.dart';
import 'package:flutterclean/domain/state/home_state.dart';
import 'package:flutterclean/internal/dependencies/repository_module.dart';

class HomeModule{
  static HomeState homeState(){
   return HomeState(
     RepositoryModule.dayRepository(),
   );
  }
}