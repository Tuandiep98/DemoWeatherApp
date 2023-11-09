import 'package:demo_weather_mvvm_app/core/models/request_models/weather_request_dto.dart';
import 'package:demo_weather_mvvm_app/core/models/response_models/weather_response_dto.dart';

abstract class IWeatherService {
  Future<WeatherResponseDto?> fetchWeather(WeatherRequestDto request);
}
