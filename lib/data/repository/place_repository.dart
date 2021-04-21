import 'package:dio/dio.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/model/place_dto.dart';
import 'package:places/data/model/places_filter_request_dto.dart';

///Репозиторий с запросами к api
class PlaceRepository {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://test-backend-flutter.surfstudio.ru',
      connectTimeout: 5000,
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
    final response = await dio.get(ApiConsts.places);
    if (response.statusCode == 200) {
      return response.data.map((json) => Place.fromJson(json)).toList();
    }
    throw Exception('HTTP request error: ${response.statusCode}');
  }

  Future<List<dynamic>> getFilteredPlaces(PlacesFilterRequestDto filter) async {
    initInterceptors();
    final response = await dio.post(
      ApiConsts.getFilteredPlaces,
      data: {
        filter.toJson(),
      },
    );
    if (response.statusCode == 200) {
      return response.data.map((json) => PlaceDto.fromJson(json)).toList();
    }
    throw Exception('HTTP request error: ${response.statusCode}');
  }

  Future<PlaceDto> createPlace(PlaceDto place) async {
    initInterceptors();
    final response = await dio.post(
      ApiConsts.places,
      data: place.toJson(),
    );
    if (response.statusCode == 200) {
      return PlaceDto.fromJson(response.data);
    } else if (response.statusCode == 400) {
      print('Invalid request.');
    } else if (response.statusCode == 409) {
      print('Object already exists');
    }
    throw Exception('HTTP request error: ${response.statusCode}');
  }

  Future<PlaceDto> getPlaceById(int id) async {
    initInterceptors();
    final response = await dio.get(ApiConsts.places + '/$id');
    if (response.statusCode == 200) {
      return PlaceDto.fromJson(response.data);
    }
    throw Exception('HTTP request error: ${response.statusCode}');
  }

  Future<PlaceDto> deletePlaceById(int id) async {
    initInterceptors();
    final response = await dio.delete(ApiConsts.places + '/$id');
    if (response.statusCode == 200) {
      print('Object successfully deleted.');
    } else if (response.statusCode == 400) {
      print('No object found.');
    }
    throw Exception('HTTP request error: ${response.statusCode}');
  }

  Future<PlaceDto> updatePlace(PlaceDto place) async {
    initInterceptors();
    final response = await dio.put(
      ApiConsts.places + '${place.id}',
      data: place.toJson(),
    );
    if (response.statusCode == 200) {
      return PlaceDto.fromJson(response.data);
    } else if (response.statusCode == 400) {
      print('Invalid request.');
    } else if (response.statusCode == 404) {
      print('No object found.');
    } else if (response.statusCode == 409) {
      print('Object already exists');
    }
    throw Exception('HTTP request error: ${response.statusCode}');
  }
}

///Константы для запросов к серверу
class ApiConsts {
  static const String places = '/place';
  static const String getFilteredPlaces = '/filtered_places';
}
