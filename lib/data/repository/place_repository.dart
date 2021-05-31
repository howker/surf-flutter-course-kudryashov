import 'dart:convert';

import 'package:places/data/model/place.dart';
import 'package:places/data/model/places_filter_request_dto.dart';
import 'package:places/dio.dart';

///Репозиторий с запросами к api
class PlaceRepository {
  Future<List<Place>> getPlaces() async {
    final response = await dio.get(ApiConsts.places);
    return jsonDecode(response.data)
        .data
        .map((response) => Place.fromJson(response))
        .toList();
  }

  Future<List<Place>> getFilteredPlaces(PlacesFilterRequestDto filter) async {
    final response =
        await dio.post(ApiConsts.getFilteredPlaces, data: filter.toJson());
    return jsonDecode(response.data)
        .data
        .map((response) => Place.fromJson(response))
        .toList();
  }

  Future<Place> createPlace(Place place) async {
    final response = await dio.post(ApiConsts.places, data: place.toJson());
    return jsonDecode(response.data)
        .data
        .map((response) => Place.fromJson(response))
        .toList();
  }

  Future<Place> getPlaceById(int id) async {
    final response = await dio.get(ApiConsts.places + '/$id');
    return jsonDecode(response.data)
        .data
        .map((response) => Place.fromJson(response))
        .toList();
  }

  Future<void> deletePlaceById(int id) async {
    await dio.delete(ApiConsts.places + '/$id');
  }

  Future<void> updatePlace(Place place) async {
    await dio.put(ApiConsts.places + '${place.id}', data: place.toJson());
  }
}

///Константы для запросов к серверу
class ApiConsts {
  static const String places = '/place';
  static const String getFilteredPlaces = '/filtered_places';
}
