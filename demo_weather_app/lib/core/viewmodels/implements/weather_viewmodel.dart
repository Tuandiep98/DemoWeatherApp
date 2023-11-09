import 'package:demo_weather_mvvm_app/core/services/interfaces/iweather_service.dart';
import 'package:demo_weather_mvvm_app/core/utils/loading_dialog_utils.dart';
import 'package:demo_weather_mvvm_app/global/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';

import '../../models/request_models/weather_request_dto.dart';
import '../../models/ui_models/weather_ui_model.dart';
import '../interfaces/iweather_viewmodel.dart';

const kGoogleApiKey = 'AIzaSyACWh-HzQy1kmaaH3SqYBn2YZluRLMnYEQ';

class WeatherViewModel extends ChangeNotifier implements IWeatherViewModel {
  WeatherUIModel _currentWeather = WeatherUIModel();
  @override
  WeatherUIModel get currentWeather => _currentWeather;

  final _weatherService = locator<IWeatherService>();

  @override
  Future<void> onSearchClicked(context) async {
    try {
      final p = await PlacesAutocomplete.show(
        context: context,
        apiKey: kGoogleApiKey,
        onError: onError,
        mode: Mode.overlay,
        language: 'en',
        components: [
          Component(Component.country, 'vn'),
          Component(Component.country, 'us'),
        ],
        // ignore: deprecated_member_use
        resultTextStyle: Theme.of(context).textTheme.subtitle1,
      );
      await placeChanges(p);
    } catch (e) {
      //logger
    }
  }

  @override
  Future<void> placeChanges(Prediction? p) async {
    try {
      // await LoadingDialogUtils.showLoading();

      if (p == null) {
        return;
      }

      // get detail (lat/lng)
      final _places = GoogleMapsPlaces(
        apiKey: kGoogleApiKey,
        apiHeaders: await const GoogleApiHeaders().getHeaders(),
      );

      final detail = await _places.getDetailsByPlaceId(p.placeId!);
      final geometry = detail.result.geometry!;
      final lat = geometry.location.lat;
      final lng = geometry.location.lng;

      WeatherRequestDto request = WeatherRequestDto(
        lat,
        lng,
        0,
        'temperature_2m,weather_code,wind_speed_10m', //required path api
        'temperature_2m,relative_humidity_2m,wind_speed_10m', //required path api
      );
      var res = await _weatherService.fetchWeather(request);
      if (res != null) {
        _currentWeather = res.toUIModel(true, '', detail.result);
      } else {}
      notifyListeners();
    } catch (e) {
      //logger
    } finally {
      // await LoadingDialogUtils.hideLoading();
    }
  }

  void onError(PlacesAutocompleteResponse response) {
    print(response.errorMessage ?? 'Unknown error');
    // logger
  }
}
