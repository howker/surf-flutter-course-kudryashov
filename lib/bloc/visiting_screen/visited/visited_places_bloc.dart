import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:places/data/interactor/place_interactor.dart';

import 'package:places/data/model/place.dart';
part 'visited_places_event.dart';
part 'visited_places_state.dart';

/// блок экрана Избранное
class VisitedPlacesBloc extends Bloc<VisitedPlacesEvent, VisitedPlacesState> {
  final PlaceInteractor _interactor;

  VisitedPlacesBloc(this._interactor) : super(VisitedPlacesLoadInProgress());

  @override
  Stream<VisitedPlacesState> mapEventToState(
    VisitedPlacesEvent event,
  ) async* {
    if (event is VisitedPlacesLoad) {
      yield* _mapLoadVisitedToState();
    } else if (event is VisitedPlacesRemovePlace) {
      yield* _mapRemovePlaceToState(event);
    }
  }

  /// список Посетил
  Stream<VisitedPlacesState> _mapLoadVisitedToState() async* {
    try {
      final placesList = await _interactor.getVisitPlaces();
      yield VisitedPlacesLoadSuccess(placesList);
    } catch (_) {
      yield VisitedPlacesLoadFailure();
      rethrow;
    }
  }

  /// удалить из избранного
  Stream<VisitedPlacesState> _mapRemovePlaceToState(
      VisitedPlacesRemovePlace event) async* {
    try {
      await _interactor.removeFromFavorites(event.place);
      add(VisitedPlacesLoad());
    } catch (_) {
      yield VisitedPlacesLoadFailure();
      rethrow;
    }
  }
}
