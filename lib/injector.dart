import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/interactor/search_interactor.dart';
import 'package:places/data/interactor/settings_interactor.dart';
import 'package:places/data/repository/place_repository.dart';
import 'package:provider/provider.dart';

class InjectorWidget extends StatelessWidget {
  final Widget child;

  const InjectorWidget({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _placeRepository = PlaceRepository();

    return MultiProvider(
      providers: [
        Provider<PlaceInteractor>(
          create: (_) => PlaceInteractor(placeRepository: _placeRepository),
          dispose: (_, interactor) {
            interactor.dispose();
          },
        ),
        Provider<SearchInteractor>(
          create: (_) => SearchInteractor(placeRepository: _placeRepository),
        ),
        ChangeNotifierProvider<SettingsInteractor>(
          create: (_) => SettingsInteractor(),
        ),
      ],
      child: child,
    );
  }
}
