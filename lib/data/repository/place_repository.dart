import 'dart:convert';

import 'package:places/data/model/place_dto.dart';
import 'package:places/data/model/places_filter_request_dto.dart';
import 'package:places/api_service.dart';

///Репозиторий с запросами к api
class PlaceRepository {
  final Api api = Api();

  Future<List<PlaceDto>> getPlaces() async {
    final response = await api.get(ApiConsts.places);
    return jsonDecode(response)
        .data
        .map((response) => PlaceDto.fromJson(response))
        .toList();
  }

  Future<List<PlaceDto>> getFilteredPlaces(
      PlacesFilterRequestDto filter) async {
    final response =
        await api.post(ApiConsts.getFilteredPlaces, filter.toJson());
    return jsonDecode(response)
        .data
        .map((response) => PlaceDto.fromJson(response))
        .toList();
  }

  Future<PlaceDto> createPlace(PlaceDto place) async {
    final response = await api.post(ApiConsts.places, place.toJson());
    return jsonDecode(response)
        .data
        .map((response) => PlaceDto.fromJson(response))
        .toList();
  }

  Future<PlaceDto> getPlaceById(int id) async {
    final response = await api.get(ApiConsts.places + '/$id');
    return jsonDecode(response)
        .data
        .map((response) => PlaceDto.fromJson(response))
        .toList();
  }

  Future<void> deletePlaceById(int id) async {
    await api.delete(ApiConsts.places + '/$id');
  }

  Future<void> updatePlace(PlaceDto place) async {
    await api.put(ApiConsts.places + '${place.id}', place.toJson());
  }
}

///Константы для запросов к серверу
class ApiConsts {
  static const String places = '/place';
  static const String getFilteredPlaces = '/filtered_places';
}
