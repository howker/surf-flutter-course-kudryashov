import 'package:places/data/interactor/search_interactor.dart';
import 'package:places/redux/action/search_action.dart';
import 'package:places/redux/state/app_state.dart';

import 'package:redux/redux.dart';

/// Обрабатываем действия в интеракторе
class SearchMiddleware implements MiddlewareClass<AppState> {
  final SearchInteractor _searchInteractor;

  SearchMiddleware(this._searchInteractor);

  @override
  call(Store<AppState> store, action, NextDispatcher next) {
    if (action is GetSearchResultAction) {
      _searchInteractor
          .searchPlaces(action.keywords)
          .then((result) => store.dispatch(LoadedSearchResultAction(result)))
          .onError((e, stackTrace) => store.dispatch(SearchErrorAction()));
    }

    next(action);
  }
}
