import 'package:dio/dio.dart';

final dio = Dio(baseOptions);

BaseOptions baseOptions = BaseOptions(
  baseUrl: 'https://jsonplaceholder.typicode.com',
  connectTimeout: 5000,
  receiveTimeout: 5000,
  sendTimeout: 5000,
  responseType: ResponseType.json,
);

void initInterceptors() {
  dio.interceptors.add(
    InterceptorsWrapper(
      onError: (error, handler) {
        print('It was error: $error');
      },
      onRequest: (options, handler) {
        print(
            'Request is sending: ${options.method} ${options.baseUrl}${options.path}');
      },
      onResponse: (responce, handler) {
        print('Answer was received: ${responce.data}');
      },
    ),
  );
}

Future<dynamic> getTestData() async {
  initInterceptors();
  final response = await dio.get(
    '/users',
    onReceiveProgress: (count, total) => print('There is: $count'),
  );
  if (response.statusCode == 200) {
    return response.data;
  }
  throw Exception('HTTP request error: ${response.statusCode}');
}
