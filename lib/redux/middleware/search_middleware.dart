import 'package:places/data/interactor/search_interactor.dart';
import 'package:places/redux/action/search_action.dart';
import 'package:places/redux/state/app_state.dart';
import 'package:redux/redux.dart';

/// Обрабатываем действия в интеракторе
class SearchMiddleware implements MiddlewareClass<AppState> {
  final SearchInteractor _searchInteractor;

  SearchMiddleware(this._searchInteractor);

  @override
  call(Store<AppState> store, action, NextDispatcher next) async {
    if (action is GetSearchResultAction) {
      var result = await _searchInteractor.searchPlaces(action.keywords);
      if (result == null)
        store.dispatch(SearchErrorAction());
      else
        store.dispatch(LoadedSearchResultAction(result));
    } else if (action is GetSearchHistoryAction) {
      _searchInteractor
          .getSearchHistory()
          .then((result) => store.dispatch(LoadedSearchHistoryAction(result)));
    }
    // else if (action is RemoveRequestFromHistoryAction) {
    //   _searchInteractor
    //       .removeKeywords(action.index)
    //       .then((value) => store.dispatch(GetSearchHistoryAction()));
    // } else if (action is ClearHistorySearchAction) {
    //   _searchInteractor
    //       .clearSearchHistory()
    //       .then((value) => store.dispatch(GetSearchHistoryAction()));
    // }

    next(action);
  }
}
