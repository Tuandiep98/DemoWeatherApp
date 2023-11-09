import 'package:json_annotation/json_annotation.dart';

import '../../utils/enum.dart';
part 'current_weather_dto.g.dart';

@JsonSerializable()
class CurrentWeatherDto {
  DateTime time;
  int interval;
  WeatherCode weather_code;
  double temperature_2m;
  double wind_speed_10m;

  CurrentWeatherDto(
    this.time,
    this.interval,
    this.weather_code,
    this.temperature_2m,
    this.wind_speed_10m,
  );

  factory CurrentWeatherDto.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentWeatherDtoToJson(this);
}
