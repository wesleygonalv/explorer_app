import 'package:get/get.dart';

/// Abstract class to help all conections in this app
/// author: @wesleygonalv
abstract class AppConnect<T> extends GetConnect {
  T fromJson(Map<String, dynamic> data);

  @override
  void onInit() {
    httpClient.defaultDecoder = (dynamic data) =>
        data is List ? data.map((e) => fromJson(e)).toList() : fromJson(data);
    httpClient.baseUrl = '';
  }
}
