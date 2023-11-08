import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../core/api/rest_client.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  setupRestClient();
}

void setupRestClient({String? bearerAuthToken = null}) {
  var dio = Dio();
  dio.options = BaseOptions(
    headers: <String, dynamic>{
      'ApiKey': "EnvironmentUtil.apiKey",
    },
    connectTimeout: const Duration(milliseconds: 30000),
    receiveTimeout: const Duration(milliseconds: 30000),
  );

  if (bearerAuthToken != null) {
    dio.options.headers["Authorization"] = "Bearer $bearerAuthToken";
  }

  // if (locator.isRegistered(instanceName: "RestClient")) {
  //   locator.unregister(instanceName: "RestClient");
  // }
  try {
    locator.registerLazySingleton(
      () => RestClient(dio, baseUrl: "https://api.open-meteo.com/v1"),
      instanceName: "RestClient",
    );
  } catch (e) {
    print(e);
  }
}

RestClient getRestClient() {
  var result = locator.get<RestClient>(instanceName: 'RestClient');
  return result;
}
