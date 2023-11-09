import 'package:demo_weather_mvvm_app/core/models/request_models/weather_request_dto.dart';
import 'package:google_maps_webservice/places.dart';

import '../response_models/weather_response_dto.dart';

class WeatherUIModel {
  bool hasData;
  WeatherResponseDto? data;
  String errorMessage;
  PlaceDetails? placeDetails;

  WeatherUIModel({
    this.hasData = false,
    this.data,
    this.errorMessage = '',
    this.placeDetails,
  });
}
