import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../core/viewmodels/implements/weather_viewmodel.dart';
import '../core/viewmodels/interfaces/iweather_viewmodel.dart';

List<SingleChildWidget> viewModelProviders = [
  ChangeNotifierProvider<IWeatherViewModel>(
    create: (_) => WeatherViewModel(),
  ),
];
