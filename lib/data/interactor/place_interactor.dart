import 'package:places/data/model/place_dto.dart';
import 'package:places/data/repository/place_repository.dart';

class PlaceInteractor {
  final PlaceRepository placeRepository = PlaceRepository();

  Future<List<PlaceDto>> getPlaces(int radius, String category) async {
    final places = await (placeRepository.getPlaces());

    return places;
  }
}
