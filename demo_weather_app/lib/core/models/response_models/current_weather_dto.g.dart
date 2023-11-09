// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherDto _$CurrentWeatherDtoFromJson(Map<String, dynamic> json) =>
    CurrentWeatherDto(
      DateTime.parse(json['time'] as String),
      json['interval'] as int,
      $enumDecode(_$WeatherCodeEnumMap, json['weather_code']),
      (json['temperature_2m'] as num).toDouble(),
      (json['wind_speed_10m'] as num).toDouble(),
    );

Map<String, dynamic> _$CurrentWeatherDtoToJson(CurrentWeatherDto instance) =>
    <String, dynamic>{
      'time': instance.time.toIso8601String(),
      'interval': instance.interval,
      'weather_code': _$WeatherCodeEnumMap[instance.weather_code]!,
      'temperature_2m': instance.temperature_2m,
      'wind_speed_10m': instance.wind_speed_10m,
    };

const _$WeatherCodeEnumMap = {
  WeatherCode.clearSky: 0,
  WeatherCode.mainlyClear: 1,
  WeatherCode.partlyCloudy: 2,
  WeatherCode.overcast: 3,
  WeatherCode.fog: 45,
  WeatherCode.depositingRimeFog: 48,
  WeatherCode.drizzleLight: 51,
  WeatherCode.drizzleModerate: 53,
  WeatherCode.drizzleDenseIntensity: 55,
  WeatherCode.freezingDrizzleLight: 56,
  WeatherCode.freezingDenseIntensity: 57,
  WeatherCode.rainSlight: 61,
  WeatherCode.rainModerate: 63,
  WeatherCode.rainHeavy: 65,
  WeatherCode.freezingRainLight: 66,
  WeatherCode.freezingRainHeavy: 67,
  WeatherCode.snowFallSlight: 71,
  WeatherCode.snowFallModerate: 73,
  WeatherCode.snowFallHeavy: 75,
  WeatherCode.snowGrains: 77,
  WeatherCode.rainShowersSlight: 80,
  WeatherCode.rainShowersModerate: 81,
  WeatherCode.rainShowersViolent: 82,
  WeatherCode.snowShowersSlight: 85,
  WeatherCode.snowShowersHeavy: 86,
  WeatherCode.thunderstorm: 95,
  WeatherCode.thunderstormWithSlightHail: 96,
  WeatherCode.thunderstormWithHeavyHail: 99,
};
