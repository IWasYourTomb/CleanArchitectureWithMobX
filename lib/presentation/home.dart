import 'package:flutter/material.dart';
import 'package:flutterclean/domain/model/day.dart';
import 'package:flutterclean/domain/state/home_state.dart';

class Home extends StatefulWidget {
  const Home({Key ? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _latController = TextEditingController();
  final _lgnController = TextEditingController();

  HomeState? _homeState;

  Day? _day;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: _getBody(),
      ),
    );
  }

  Widget _getBody(){
    return SafeArea(
      child: Padding(
        padding:  const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _getRowInput(),
            const SizedBox(height: 20),
            ElevatedButton(
               child: const Text('Получить'),
                onPressed: _getDay,
               ),
            const SizedBox(height: 20),
            if(_day != null) _getDayInfo(_day!),
          ],
        ),
      ),
    );
  }

  Widget _getRowInput(){
    return Row(
      children: [
        Expanded(
            child: TextField(
              controller: _latController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
              decoration: const InputDecoration(hintText: 'Широта'),
            )
       ),
        const SizedBox(width: 20),
        Expanded(
            child: TextField(
              controller: _lgnController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
              decoration: const InputDecoration(hintText: 'Долгота'),
            )
        ),
      ],
    );
  }

  Widget _getDayInfo(Day day){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Восход: ${day.sunrise?.toLocal() ?? 'Ошибка'}'),
        Text('Заход: ${day.sunset?.toLocal() ?? 'Ошибка'}'),
        Text('Полдень: ${day.solarNoon?.toLocal() ?? 'Ошибка'}'),
        Text('Продолжительность: ${Duration(seconds: day.dayLength)}'),
      ],
    );
  }

  void _getDay(){
    final lat = double.tryParse(_latController.text);
    final lng = double.tryParse(_lgnController.text);
    _homeState?.getDay(latitude: lat!, longitude: lng!);
    print( _homeState?.getDay(latitude: lat!, longitude: lng!));
  }
}
