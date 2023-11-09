import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_icons/weather_icons.dart';
part 'enum_helper.dart';

enum WeatherCode {
  @JsonValue(0)
  clearSky,
  @JsonValue(1)
  mainlyClear,
  @JsonValue(2)
  partlyCloudy,
  @JsonValue(3)
  overcast,

  @JsonValue(45)
  fog,
  @JsonValue(48)
  depositingRimeFog,
  @JsonValue(51)
  drizzleLight,
  @JsonValue(53)
  drizzleModerate,
  @JsonValue(55)
  drizzleDenseIntensity,

  @JsonValue(56)
  freezingDrizzleLight,
  @JsonValue(57)
  freezingDenseIntensity,

  @JsonValue(61)
  rainSlight,
  @JsonValue(63)
  rainModerate,
  @JsonValue(65)
  rainHeavy,

  @JsonValue(66)
  freezingRainLight,
  @JsonValue(67)
  freezingRainHeavy,

  @JsonValue(71)
  snowFallSlight,
  @JsonValue(73)
  snowFallModerate,
  @JsonValue(75)
  snowFallHeavy,
  @JsonValue(77)
  snowGrains,

  @JsonValue(80)
  rainShowersSlight,
  @JsonValue(81)
  rainShowersModerate,
  @JsonValue(82)
  rainShowersViolent,

  @JsonValue(85)
  snowShowersSlight,
  @JsonValue(86)
  snowShowersHeavy,

  @JsonValue(95)
  thunderstorm,
  @JsonValue(96)
  thunderstormWithSlightHail,
  @JsonValue(99)
  thunderstormWithHeavyHail,
}
