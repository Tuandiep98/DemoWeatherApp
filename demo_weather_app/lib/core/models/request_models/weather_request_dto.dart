import 'package:json_annotation/json_annotation.dart';

part 'weather_request_dto.g.dart';

@JsonSerializable()
class WeatherRequestDto {
  double latitude;
  double longitude;
  int zipcode;
  String current = 'temperature_2m,weather_code,wind_speed_10m';
  String hourly = 'temperature_2m,relative_humidity_2m,wind_speed_10m';

  WeatherRequestDto(
    this.latitude,
    this.longitude,
    this.zipcode,
    this.current,
    this.hourly,
  );

  factory WeatherRequestDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherRequestDtoToJson(this);
}
