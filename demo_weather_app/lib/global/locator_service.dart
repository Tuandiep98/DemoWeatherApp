import 'package:demo_weather_mvvm_app/core/services/implements/weather_service.dart';
import 'package:demo_weather_mvvm_app/core/services/interfaces/iweather_service.dart';
import 'package:get_it/get_it.dart';

void registerServiceSingletons(GetIt locator) {
  locator.registerLazySingleton<IWeatherService>(() => WeatherService());
}
