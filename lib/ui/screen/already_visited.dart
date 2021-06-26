import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/bloc/visiting_screen/visited/visited_places_bloc.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/svg_path_const.dart';
import 'package:places/text_string_const.dart';
import 'package:places/ui/widgets/empty_visit_screen.dart';
import 'package:places/ui/widgets/sight_card.dart';
import 'package:provider/provider.dart';

/// Экран "Уже посетил"
class AlreadyVisitedTab extends StatefulWidget {
  @override
  _AlreadyVisitedTabState createState() => _AlreadyVisitedTabState();
}

class _AlreadyVisitedTabState extends State<AlreadyVisitedTab> {
  @override
  void initState() {
    super.initState();
    context.read<VisitedPlacesBloc>().add(VisitedPlacesLoad());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VisitedPlacesBloc, VisitedPlacesState>(
      builder: (_, state) {
        if (state is VisitedPlacesLoadSuccess) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return AspectRatio(
                aspectRatio: 3 / 2,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width),
                  child: SightCard.alreadyVisited(
                    key: ValueKey(state.placesList[index].name),
                    place: state.placesList[index],
                    onRemoveCard: () => context
                        .read<VisitedPlacesBloc>()
                        .add(VisitedPlacesRemovePlace(state.placesList[index])),
                    onReorderCard: () => context
                        .read<VisitedPlacesBloc>()
                        .add(VisitedPlacesLoad()),
                    onDismissedCard: () => context
                        .read<VisitedPlacesBloc>()
                        .add(VisitedPlacesRemovePlace(state.placesList[index])),
                    candidateDataList: state.placesList,
                  ),
                ),
              );
            },
            itemCount: state.placesList.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
          );
        } else if (state is VisitedPlacesLoadInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else
          return const EmptyVisitScreen(
            icon: go,
            text: finishRoute,
          );
      },
    );
  }
}
