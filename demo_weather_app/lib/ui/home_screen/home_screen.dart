import 'dart:async';

import 'package:demo_weather_mvvm_app/core/api/rest_client.dart';
import 'package:demo_weather_mvvm_app/core/modules/weather_module/models/request_models/weather_request_dto.dart';
import 'package:demo_weather_mvvm_app/core/modules/weather_module/models/response_models/weather_response_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';

import '../../global/locator.dart';

const kGoogleApiKey = 'AIzaSyACWh-HzQy1kmaaH3SqYBn2YZluRLMnYEQ';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final homeScaffoldKey = GlobalKey<ScaffoldState>();
final searchScaffoldKey = GlobalKey<ScaffoldState>();

class _HomeScreenState extends State<HomeScreen> {
  Mode _mode = Mode.overlay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildDropdownMenu(),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _handlePressButton,
              child: const Text('Search places'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/search');
              },
              child: const Text('Custom'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownMenu() {
    return DropdownButton<Mode>(
      value: _mode,
      items: const <DropdownMenuItem<Mode>>[
        DropdownMenuItem<Mode>(
          value: Mode.overlay,
          child: Text('Overlay'),
        ),
        DropdownMenuItem<Mode>(
          value: Mode.fullscreen,
          child: Text('Fullscreen'),
        ),
      ],
      onChanged: (m) {
        if (m != null) {
          setState(() => _mode = m);
        }
      },
    );
  }

  Future<void> _handlePressButton() async {
    void onError(PlacesAutocompleteResponse response) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response.errorMessage ?? 'Unknown error'),
        ),
      );
    }

    // show input autocomplete with selected mode
    // then get the Prediction selected
    final p = await PlacesAutocomplete.show(
      context: context,
      apiKey: kGoogleApiKey,
      onError: onError,
      mode: _mode,
      language: 'vi',
      components: [Component(Component.country, 'vi')],
      // TODO: Since we supports Flutter >= 2.8.0
      // ignore: deprecated_member_use
      resultTextStyle: Theme.of(context).textTheme.subtitle1,
    );

    await displayPrediction(p, ScaffoldMessenger.of(context));
  }
}

Future<void> displayPrediction(
    Prediction? p, ScaffoldMessengerState messengerState) async {
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

  // try {
  //   WeatherRequestDto request = WeatherRequestDto(
  //     lat,
  //     lng,
  //     0,
  //     'temperature_2m,weather_code,wind_speed_10m',
  //     'temperature_2m,relative_humidity_2m,wind_speed_10m',
  //   );
  //   WeatherResponseDto responseDto =
  //       await getRestClient().fetchWeather(request);
  // } catch (e) {
  //   print(e);
  // }
  WeatherRequestDto request = WeatherRequestDto(
    lat,
    lng,
    0,
    'temperature_2m,weather_code,wind_speed_10m',
    'temperature_2m,relative_humidity_2m,wind_speed_10m',
  );
  WeatherResponseDto responseDto = await getRestClient().fetchWeather(
    lat,
    lng,
    'temperature_2m,weather_code,wind_speed_10m',
    'temperature_2m,relative_humidity_2m,wind_speed_10m',
  );
  var a = 1;

  messengerState.showSnackBar(
    SnackBar(
      content: Text('${detail.result.name} - $lat/$lng'),
    ),
  );
}
