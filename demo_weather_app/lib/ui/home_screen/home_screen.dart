import 'package:demo_weather_mvvm_app/core/viewmodels/interfaces/iweather_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

import '../../core/utils/enum.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final homeScaffoldKey = GlobalKey<ScaffoldState>();
final searchScaffoldKey = GlobalKey<ScaffoldState>();

class _HomeScreenState extends State<HomeScreen> {
  late IWeatherViewModel _viewModel;

  @override
  void initState() {
    _viewModel = context.read<IWeatherViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Demo App'),
      ),
      body: StreamBuilder<InternetConnectionStatus>(
          stream: InternetConnectionChecker().onStatusChange,
          builder: (context, snapshot) {
            if (snapshot.hasError ||
                (snapshot.hasData &&
                    snapshot.data == InternetConnectionStatus.disconnected)) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.signal_wifi_off_outlined,
                      size: 60,
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Oops! connection lost',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              );
            }
            return Consumer<IWeatherViewModel>(builder: (_, __, ___) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () async =>
                          await _viewModel.onSearchClicked(context),
                      child: const Text('Search places'),
                    ),
                    const SizedBox(height: 20),
                    _viewModel.currentWeather.hasData
                        ? SizedBox(
                            child: Column(
                              children: [
                                Icon(
                                  EnumHelper.getIcon(
                                      EnumMap.weatherCode,
                                      _viewModel.currentWeather.data?.current
                                          .weather_code),
                                  size: 60,
                                ),
                                const SizedBox(height: 30),
                                Text(
                                  _viewModel
                                          .currentWeather.placeDetails?.name ??
                                      '',
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  _viewModel.currentWeather.data
                                          ?.getWeatherCodeAsString() ??
                                      '',
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Temp:',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      _viewModel.currentWeather.data
                                              ?.getTemparatureAsString() ??
                                          '',
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const Text(
                                      'Wind:',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      _viewModel.currentWeather.data
                                              ?.getWindSpeedAsString() ??
                                          '',
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              );
            });
          }),
    );
  }
}
