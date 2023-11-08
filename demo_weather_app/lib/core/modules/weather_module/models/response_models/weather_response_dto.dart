import 'package:demo_weather_mvvm_app/core/modules/weather_module/models/response_models/current_weather_dto.dart';
import 'package:json_annotation/json_annotation.dart';

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
}
