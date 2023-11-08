// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_unit_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherUnitDto _$CurrentWeatherUnitDtoFromJson(
        Map<String, dynamic> json) =>
    CurrentWeatherUnitDto(
      json['time'] as String,
      json['interval'] as String,
      json['temperature_2m'] as String,
      json['wind_speed_10m'] as String,
      json['weather_code'] as String,
    );

Map<String, dynamic> _$CurrentWeatherUnitDtoToJson(
        CurrentWeatherUnitDto instance) =>
    <String, dynamic>{
      'time': instance.time,
      'interval': instance.interval,
      'temperature_2m': instance.temperature_2m,
      'wind_speed_10m': instance.wind_speed_10m,
      'weather_code': instance.weather_code,
    };
