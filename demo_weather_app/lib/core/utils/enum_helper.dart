part of 'enum.dart';

/// Workaround to achieve enum with value (like in `C#`)
class EnumHelper {
  static int getValue<T>(Map<T, MyEnum> enumMap, T myEnum) {
    if (myEnum == null) {
      return -2;
    }

    return enumMap[myEnum]!.value;
  }

  static String getDescription<T>(Map<T, MyEnum> enumMap, T myEnum) {
    if (myEnum == null) {
      return '';
    }

    return enumMap[myEnum]!.description;
  }

  static IconData getIcon<T>(Map<T, MyEnum> enumMap, T myEnum) {
    return enumMap[myEnum]?.icon ?? WeatherIcons.na;
  }

  // static T getEnum<T>(Map<T, MyEnum> enumMap, int value) {
  //   return enumMap.keys.firstWhere(
  //     (key) => enumMap[key]!.value == value,
  //     orElse: () => null,
  //   );
  // }

  // static T getEnumFromDescription<T>(
  //     Map<T, MyEnum> enumMap, String description) {
  //   return enumMap.keys.firstWhere(
  //     (key) => enumMap[key]!.description == description,
  //     orElse: () => null,
  //   );
  // }
}

class MyEnum {
  int value;
  String description;
  IconData? icon;

  MyEnum({
    this.value = 0,
    this.description = '',
    this.icon = WeatherIcons.na,
  });
}

class EnumMap {
  static Map<WeatherCode, MyEnum> weatherCode = {
    WeatherCode.clearSky: MyEnum(
        value: 0, description: 'Clear Sky', icon: WeatherIcons.day_sunny),
    WeatherCode.mainlyClear: MyEnum(
        value: 1, description: 'Mainly clear', icon: WeatherIcons.day_sunny),
    WeatherCode.partlyCloudy: MyEnum(
        value: 2, description: 'Partly cloudy', icon: WeatherIcons.day_sunny),
    WeatherCode.overcast: MyEnum(
        value: 3,
        description: 'Overcast',
        icon: WeatherIcons.day_sunny_overcast),
    WeatherCode.fog:
        MyEnum(value: 45, description: 'Fog', icon: WeatherIcons.day_fog),
    WeatherCode.depositingRimeFog: MyEnum(
        value: 46,
        description: 'Depositing rime fog',
        icon: WeatherIcons.day_fog),
    WeatherCode.drizzleLight: MyEnum(
        value: 51,
        description: 'Drizzle light intensity',
        icon: WeatherIcons.day_rain),
    WeatherCode.drizzleModerate: MyEnum(
        value: 53,
        description: 'Drizzle moderate intensity',
        icon: WeatherIcons.day_rain),
    WeatherCode.drizzleDenseIntensity: MyEnum(
        value: 55,
        description: 'Drizzle dense intensity',
        icon: WeatherIcons.day_rain_mix),
    WeatherCode.freezingDrizzleLight: MyEnum(
        value: 56,
        description: 'Freezing drizzle light intensity',
        icon: WeatherIcons.day_rain_wind),
    WeatherCode.freezingDenseIntensity: MyEnum(
        value: 57,
        description: 'Freezing drizzle dense intensity',
        icon: WeatherIcons.day_rain_wind),
    WeatherCode.rainSlight: MyEnum(
        value: 61,
        description: 'Rains light intensity',
        icon: WeatherIcons.raindrop),
    WeatherCode.rainModerate: MyEnum(
        value: 63,
        description: 'Rains moderate intensity',
        icon: WeatherIcons.raindrops),
    WeatherCode.rainHeavy: MyEnum(
        value: 65,
        description: 'Rains heavy intensity',
        icon: WeatherIcons.raindrop),
    WeatherCode.freezingRainLight: MyEnum(
        value: 66,
        description: 'Freezing rain light intensity',
        icon: WeatherIcons.rain_mix),
    WeatherCode.freezingRainHeavy: MyEnum(
        value: 67,
        description: 'Freezing rain heavy intensity',
        icon: WeatherIcons.rain_mix),
    WeatherCode.snowFallSlight: MyEnum(
        value: 71,
        description: 'Snow fall light intensity',
        icon: WeatherIcons.snow),
    WeatherCode.snowFallModerate: MyEnum(
        value: 73,
        description: 'Snow fall moderate intensity',
        icon: WeatherIcons.snow),
    WeatherCode.snowFallHeavy: MyEnum(
        value: 75,
        description: 'Snow fall heavy intensity',
        icon: WeatherIcons.snowflake_cold),
    WeatherCode.snowGrains: MyEnum(
        value: 77,
        description: 'Snow grains',
        icon: WeatherIcons.snowflake_cold),
    WeatherCode.rainShowersSlight: MyEnum(
        value: 80,
        description: 'Rain showers slight',
        icon: WeatherIcons.rain),
    WeatherCode.rainShowersModerate: MyEnum(
        value: 81,
        description: 'Rain showers moderate',
        icon: WeatherIcons.storm_showers),
    WeatherCode.rainShowersViolent: MyEnum(
        value: 82,
        description: 'Rain showers violent',
        icon: WeatherIcons.storm_showers),
    WeatherCode.snowShowersSlight: MyEnum(
        value: 85, description: 'Snow showers slight', icon: WeatherIcons.snow),
    WeatherCode.snowShowersHeavy: MyEnum(
        value: 86,
        description: 'Snow showers heavy',
        icon: WeatherIcons.snowflake_cold),
    WeatherCode.thunderstorm: MyEnum(
        value: 95,
        description: 'Thunderstorm: slight or moderate',
        icon: WeatherIcons.thunderstorm),
    WeatherCode.thunderstormWithSlightHail: MyEnum(
        value: 96,
        description: 'Thunderstorm with slight hail',
        icon: WeatherIcons.day_snow_thunderstorm),
    WeatherCode.thunderstormWithHeavyHail: MyEnum(
        value: 99,
        description: 'Thunderstorm with heavy hail',
        icon: WeatherIcons.day_snow_thunderstorm),
  };
}
