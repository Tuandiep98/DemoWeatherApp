// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponseDto _$WeatherResponseDtoFromJson(Map<String, dynamic> json) =>
    WeatherResponseDto(
      (json['latitude'] as num).toDouble(),
      (json['longitude'] as num).toDouble(),
      (json['generationtime_ms'] as num).toDouble(),
      json['timezone'] as String,
      CurrentWeatherDto.fromJson(json['current'] as Map<String, dynamic>),
      CurrentWeatherUnitDto.fromJson(
          json['current_units'] as Map<String, dynamic>),
      (json['elevation'] as num).toDouble(),
    );

Map<String, dynamic> _$WeatherResponseDtoToJson(WeatherResponseDto instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'generationtime_ms': instance.generationtime_ms,
      'timezone': instance.timezone,
      'elevation': instance.elevation,
      'current': instance.current,
      'current_units': instance.current_units,
    };
