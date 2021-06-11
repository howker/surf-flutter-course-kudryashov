import 'dart:async';
import 'dart:math';
import 'package:places/data/model/place.dart';
import 'package:places/data/model/places_filter_request_dto.dart';
import 'package:places/data/repository/place_repository.dart';

class PlaceInteractor {
  final PlaceRepository placeRepository;

  PlaceInteractor({this.placeRepository});

  StreamController<List<Place>> _favoritesListController =
      StreamController.broadcast();

  Stream<List<Place>> get favoriteListStream => _favoritesListController.stream;

  StreamController<List<Place>> placesController = StreamController.broadcast();
  Stream<List<Place>> get placeStream => placesController.stream;

  void dispose() {
    placesController.close();
    _favoritesListController.close();
  }

  Future<List<Place>> getPlaces(PlacesFilterRequestDto filter) async {
    try {
      final places = await (placeRepository.getFilteredPlaces(filter));
      places.sort((a, b) => (GeoUtils.distanceInMetersBetweenEarthCoordinates(
                  GeoUtils.getMyCoordinates()['lat'],
                  GeoUtils.getMyCoordinates()['lon'],
                  a.lat,
                  a.lng)
              .toInt())
          .compareTo(GeoUtils.distanceInMetersBetweenEarthCoordinates(
                  GeoUtils.getMyCoordinates()['lat'],
                  GeoUtils.getMyCoordinates()['lon'],
                  b.lat,
                  b.lng)
              .toInt()));
      placesController.sink.add(places);
      return places;
    } catch (e) {
      placesController.sink.addError(e);
    }
  }

  Future<Place> getPlaceDetails(int id) async {
    final place = await (placeRepository.getPlaceById(id));
    return place;
  }

  Future<List<Place>> getFavoritesPlaces() async {
    //на данном этапе заполняем моковыми данными
    final favoritesPlaces = await (placeRepository.testSetFavoritesPlaces());

    favoritesPlaces.sort((a, b) =>
        (GeoUtils.distanceInMetersBetweenEarthCoordinates(
                    GeoUtils.getMyCoordinates()['lat'],
                    GeoUtils.getMyCoordinates()['lon'],
                    a.lat,
                    a.lng)
                .toInt())
            .compareTo(GeoUtils.distanceInMetersBetweenEarthCoordinates(
                    GeoUtils.getMyCoordinates()['lat'],
                    GeoUtils.getMyCoordinates()['lon'],
                    b.lat,
                    b.lng)
                .toInt()));

    _favoritesListController.add(favoritesPlaces);

    return favoritesPlaces;
  }

  Future<bool> addToFavorites(Place place) async {
    bool result = false;
    //на данном этапе заполняем моковыми данными
    final favoritesPlaces = await placeRepository.testSetFavoritesPlaces();

    favoritesPlaces.forEach(
      (element) {
        element.id == place.id ? result = false : result = true;
      },
    );
    if (result) favoritesPlaces.add(place);
    _favoritesListController.add(favoritesPlaces);

    return result;
  }

  Future<bool> removeFromFavorites(Place place) async {
    bool result = false;
    //на данном этапе заполняем моковыми данными
    final favoritesPlaces = await (placeRepository.testSetFavoritesPlaces());

    favoritesPlaces.forEach(
      (element) {
        element.id == place.id ? result = false : result = true;
      },
    );
    if (result) favoritesPlaces.remove(place);
    _favoritesListController.add(favoritesPlaces);
    return result;
  }

  Future<List<Place>> getVisitPlaces() async {
    //на данном этапе заполняем моковыми данными
    final visitPlaces = await (placeRepository.testSetFavoritesPlaces());

    return visitPlaces;
  }

  Future<bool> addToVisitingPlaces(Place place) async {
    bool result = false;
    //на данном этапе заполняем моковыми данными
    final visitPlaces = await (placeRepository.testSetFavoritesPlaces());

    visitPlaces.forEach(
      (element) {
        element.id == place.id ? result = false : result = true;
      },
    );
    if (result) visitPlaces.add(place);

    return result;
  }

  Future<bool> addNewPlace(Place place) async {
    try {
      await (placeRepository.createPlace(place));
      return true;
    } catch (_) {
      return false;
    }
  }
}

///Расчёт дистанции между 2 точками по координатам
class GeoUtils {
  static double _degreesToRadians(degrees) {
    return degrees * pi / 180;
  }

  static double distanceInMetersBetweenEarthCoordinates(
      lat1, lon1, lat2, lon2) {
    var earthRadiusKm = 6371;

    var dLat = _degreesToRadians(lat2 - lat1);
    var dLon = _degreesToRadians(lon2 - lon1);

    lat1 = _degreesToRadians(lat1);
    lat2 = _degreesToRadians(lat2);

    var a = sin(dLat / 2) * sin(dLat / 2) +
        sin(dLon / 2) * sin(dLon / 2) * cos(lat1) * cos(lat2);
    var c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadiusKm * c * 1000;
  }

  static Map<String, double> getMyCoordinates() {
    Map<String, double> coords = {
      'lat': 55.989198, //моковые
      'lon': 37.601605, //моковые
    };
    return coords;
  }
}
