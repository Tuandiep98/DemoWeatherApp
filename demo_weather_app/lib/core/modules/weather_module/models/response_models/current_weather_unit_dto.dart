import 'package:json_annotation/json_annotation.dart';
part 'current_weather_unit_dto.g.dart';

@JsonSerializable()
class CurrentWeatherUnitDto {
  String time;
  String interval;
  String temperature_2m;
  String wind_speed_10m;
  String weather_code;

  CurrentWeatherUnitDto(
    this.time,
    this.interval,
    this.temperature_2m,
    this.wind_speed_10m,
    this.weather_code,
  );

  factory CurrentWeatherUnitDto.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherUnitDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentWeatherUnitDtoToJson(this);
}
