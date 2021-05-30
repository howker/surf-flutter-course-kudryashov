import 'package:dio/dio.dart';

class Api {
  Api() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com',
        connectTimeout: 5000,
        receiveTimeout: 5000,
        sendTimeout: 5000,
        responseType: ResponseType.json,
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          print('It was error: $error');
        },
        onRequest: (options, handler) {
          print(
              'Request is sending: ${options.method} ${options.baseUrl}${options.path}');
          return handler.next(options);
        },
        onResponse: (responce, handler) {
          print('Answer was received: ${responce.data}');
          return handler.next(responce);
        },
      ),
    );
  }
  Dio dio;

  Future<String> get<T>(String path) async {
    final response = await dio.get<T>(path);
    return _getResponseData(response);
  }

  Future<String> post<T>(String path, Map<String, dynamic> data) async {
    final response = await dio.post<T>(path, data: data);
    return _getResponseData(response);
  }

  Future<String> delete<T>(String path) async {
    final response = await dio.delete(path);
    return _getResponseData(response);
  }

  Future<String> put<T>(String path, Map<String, dynamic> data) async {
    final response = await dio.delete(path);
    return _getResponseData(response);
  }

  String _getResponseData(Response response) {
    if (response == null) {
      throw Exception('Network Unreachable');
    }
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data.toString();
      case 400:
        throw Exception(response.data.toString());
      case 409:
        throw Exception('Object Already Exists');
      case 404:
        throw Exception('No Object Found');
      case 500:
      default:
        throw Exception('Server Responded With ${response.statusCode} Code');
    }
  }
}
