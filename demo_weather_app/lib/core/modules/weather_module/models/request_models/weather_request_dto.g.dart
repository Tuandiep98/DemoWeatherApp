// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherRequestDto _$WeatherRequestDtoFromJson(Map<String, dynamic> json) =>
    WeatherRequestDto(
      (json['latitude'] as num).toDouble(),
      (json['longitude'] as num).toDouble(),
      json['zipcode'] as int,
      json['current'] as String,
      json['hourly'] as String,
    );

Map<String, dynamic> _$WeatherRequestDtoToJson(WeatherRequestDto instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'zipcode': instance.zipcode,
      'current': instance.current,
      'hourly': instance.hourly,
    };
