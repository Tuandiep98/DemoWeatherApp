import 'package:demo_weather_mvvm_app/core/models/request_models/weather_request_dto.dart';
import 'package:demo_weather_mvvm_app/core/models/response_models/weather_response_dto.dart';
import 'package:demo_weather_mvvm_app/core/services/interfaces/iweather_service.dart';

import '../../../global/locator.dart';

class WeatherService implements IWeatherService {
  @override
  Future<WeatherResponseDto?> fetchWeather(WeatherRequestDto request) async {
    try {
      WeatherResponseDto responseDto = await getRestClient().fetchWeather(
        request.latitude,
        request.longitude,
        request.current,
        request.hourly,
      );
      return responseDto;
    } catch (e) {
      //Logger
      return null;
    }
  }
}
