import 'package:dio/dio.dart';
import 'package:places/data/repository/network_exception.dart';

final dio = Dio(BaseOptions(
  baseUrl: 'https://test-backend-flutter.surfstudio.ru/111',
  connectTimeout: 5000,
  receiveTimeout: 5000,
  sendTimeout: 5000,
))
  ..interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        final data = options.data?.toString();
        final msg = data?.isNotEmpty == true ? '\n$data' : '';
        print('REQUEST: ${options.path}$msg');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print(
          'RESPONSE: ${response.statusCode} for ' +
              '${response.requestOptions.method} ${response.requestOptions.path}',
        );
        return handler.next(response);
      },
      onError: (e, handler) {
        print(
          NetworkException(
              responseName: e.requestOptions.method, exceptionName: e.error),
        );

        return handler.next(e);
      },
    ),
  );
