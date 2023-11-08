import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../modules/weather_module/models/request_models/weather_request_dto.dart';
import '../modules/weather_module/models/response_models/weather_response_dto.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://api.open-meteo.com/v1")
@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {required String baseUrl}) = _RestClient;

  @GET("/forecast")
  Future<WeatherResponseDto> fetchWeather(@Query('latitude') double latitude,
      @Query('longitude') double longitude,
      @Query('current') String current,
      @Query('hourly') String hourly);
}
