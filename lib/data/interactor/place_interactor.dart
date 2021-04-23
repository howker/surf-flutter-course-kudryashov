import 'package:places/data/model/place_dto.dart';
import 'package:places/data/model/places_filter_request_dto.dart';
import 'package:places/data/repository/place_repository.dart';

class PlaceInteractor {
  static final PlaceRepository placeRepository = PlaceRepository();
  List<PlaceDto> favoritesPlaces = [];

  static Future<List<PlaceDto>> getPlaces(PlacesFilterRequestDto filter) async {
    final places = await (placeRepository.getFilteredPlaces(filter));

    places.sort((a, b) => a.distance.compareTo(b.distance));
    return places;
  }

  static Future<PlaceDto> getPlaceDetails(int id) async {
    final place = await (placeRepository.getPlaceById(id));
    return place;
  }

  static List<PlaceDto> getFavoritesPlaces() {
    //favoritesPlaces.sort((a, b) => a.distance.compareTo(b.distance));
    //return favoritesPlaces;
  }
}
