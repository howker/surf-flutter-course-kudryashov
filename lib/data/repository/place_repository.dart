import 'dart:math';

import 'package:dio/dio.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/model/place_dto.dart';

class PlaceRepository {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://test-backend-flutter.surfstudio.ru',
      connectTimeout: 10000,
      receiveTimeout: 5000,
      sendTimeout: 5000,
      responseType: ResponseType.json,
    ),
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
          return handler.next(options);
        },
        onResponse: (responce, handler) {
          print('Answer was received: ${responce.data}');
          return handler.next(responce);
        },
      ),
    );
  }

  Future<List<dynamic>> getPlaces() async {
    initInterceptors();
    final response = await dio.get(ApiConsts.getPlaces);
    if (response.statusCode == 200) {
      return response.data.map((json) => Place.fromJson(json)).toList();
    }
    throw Exception('HTTP request error: ${response.statusCode}');
  }

  Future<List<dynamic>> getFilteredPlaces() async {
    initInterceptors();
    final response = await dio.post(
      ApiConsts.getFilteredPlaces,
      data: {
        'lat': 55.753215,
        'lng': 37.622504,
        'radius': 10000.0,
        'typeFilter': [
          'temple',
          'monument',
          'park',
          'theatre',
          'museum',
          'hotel',
          'restaurant',
          'cafe',
          'other'
        ],
        'nameFilter': '',
      },
    );
    if (response.statusCode == 200) {
      return response.data.map((json) => PlaceDto.fromJson(json)).toList();
    }
    throw Exception('HTTP request error: ${response.statusCode}');
  }

  Future<dynamic> createPlace() async {
    initInterceptors();
    final response = await dio.post(
      ApiConsts.createPlace,
      data: {
        'id': Random(),
        'lat': 46.349540,
        'lng': 48.030772,
        'placeType': 'museum',
        'description': '''историко-архитектурный комплекс, крепость,
            история которой началась в 1558 году. Изначально крепость была деревянной,
             но давление со стороны турецко-татарских войск, междоусобицы и военные конфликты,
              мешающие укреплению и росту страны, привели к строительству более мощной и защищённой 
              крепости''',
      },
    );
    if (response.statusCode == 200) {
      return response.data.map((json) => Place.fromJson(json)).toList();
    }
    throw Exception('HTTP request error: ${response.statusCode}');
  }
}

class ApiConsts {
  static const String getPlaces = '/place';
  static const String getFilteredPlaces = '/filtered_places';
  static const String createPlace = '/place';
  // /upload_file
  // /files/{path}
  // /client/{path}
}
