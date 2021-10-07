import 'package:dio/dio.dart';

class DioSingleton {
  static final DioSingleton _singleton = new DioSingleton._internal();

  DioSingleton._internal();

  static DioSingleton get instance => _singleton;

  var dio = Dio();

  void create() {
    BaseOptions options = new BaseOptions(
      connectTimeout: 60000,
      receiveTimeout: 60000,
    );

    dio = new Dio(options);

    dio.interceptors
      ..add(InterceptorsWrapper(
        onRequest: (RequestOptions options, handler) {
          handler.next(options);
          return options;
        },
        onError: (DioError error, handler) async {
          handler.next(error);

          return error;
        },
        onResponse: (Response response, handler) {
          handler.next(response);
          return response;
        },
      ));
  }
}

Future postHttp({String path, dynamic data}) =>
    DioSingleton.instance.dio.post(path, data: data);

Future postHttpWithoutData({String path}) =>
    DioSingleton.instance.dio.post(path);

Future putHttp(String path, [dynamic data]) =>
    DioSingleton.instance.dio.put(path, data: data);

Future deleteHttp(String path, {dynamic data}) =>
    DioSingleton.instance.dio.delete(path, data: data);

Future getHttp({String path}) => DioSingleton.instance.dio.get(path);
