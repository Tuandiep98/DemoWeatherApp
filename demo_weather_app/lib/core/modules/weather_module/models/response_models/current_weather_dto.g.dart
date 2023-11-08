// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherDto _$CurrentWeatherDtoFromJson(Map<String, dynamic> json) =>
    CurrentWeatherDto(
      DateTime.parse(json['time'] as String),
      json['interval'] as int,
      json['weather_code'] as int,
      (json['temperature_2m'] as num).toDouble(),
      (json['wind_speed_10m'] as num).toDouble(),
    );

Map<String, dynamic> _$CurrentWeatherDtoToJson(CurrentWeatherDto instance) =>
    <String, dynamic>{
      'time': instance.time.toIso8601String(),
      'interval': instance.interval,
      'weather_code': instance.weather_code,
      'temperature_2m': instance.temperature_2m,
      'wind_speed_10m': instance.wind_speed_10m,
    };
