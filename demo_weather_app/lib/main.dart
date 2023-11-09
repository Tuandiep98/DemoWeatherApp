import 'dart:io';

import 'package:demo_weather_mvvm_app/ui/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/utils/http_override.dart';
import 'global/locator.dart';
import 'global/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [...viewModelProviders],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
