import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';

import '../../models/ui_models/weather_ui_model.dart';

abstract class IWeatherViewModel extends ChangeNotifier {
  WeatherUIModel get currentWeather;
  Future<void> placeChanges(Prediction? p);
  Future<void> onSearchClicked(BuildContext context);
}
