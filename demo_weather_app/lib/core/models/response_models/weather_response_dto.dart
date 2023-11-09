// ignore_for_file: unnecessary_string_interpolations

import 'package:demo_weather_mvvm_app/core/models/request_models/weather_request_dto.dart';
import 'package:demo_weather_mvvm_app/core/models/ui_models/weather_ui_model.dart';
import 'package:demo_weather_mvvm_app/core/utils/enum.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:json_annotation/json_annotation.dart';

import 'current_weather_dto.dart';
import 'current_weather_unit_dto.dart';
part 'weather_response_dto.g.dart';

@JsonSerializable()
class WeatherResponseDto {
  double latitude;
  double longitude;
  double generationtime_ms;
  String timezone;
  double elevation;
  CurrentWeatherDto current;
  CurrentWeatherUnitDto current_units;

  WeatherResponseDto(
    this.latitude,
    this.longitude,
    this.generationtime_ms,
    this.timezone,
    this.current,
    this.current_units,
    this.elevation,
  );

  factory WeatherResponseDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherResponseDtoToJson(this);

  WeatherUIModel toUIModel(
      bool hasData, String errorMessage, PlaceDetails placeDetails) {
    return WeatherUIModel(
      hasData: hasData,
      data: this,
      errorMessage: errorMessage,
      placeDetails: placeDetails,
    );
  }

  String getTemparatureAsString() {
    return '${current.temperature_2m} ${current_units.temperature_2m}';
  }

  String getWindSpeedAsString() {
    return '${current.wind_speed_10m} ${current_units.wind_speed_10m}';
  }

  String getWeatherCodeAsString() {
    return '${EnumHelper.getDescription(EnumMap.weatherCode, current.weather_code)}';
  }
}
