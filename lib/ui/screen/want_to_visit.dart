import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/bloc/visiting_screen/planned/planned_places_bloc.dart';
import 'package:places/svg_path_const.dart';
import 'package:places/text_string_const.dart';
import 'package:places/ui/widgets/empty_visit_screen.dart';
import 'package:places/ui/widgets/sight_card.dart';
import 'package:provider/provider.dart';

/// Экран "Хочу посетить"
class WantToVisitTab extends StatefulWidget {
  @override
  _WantToVisitTabState createState() => _WantToVisitTabState();
}

class _WantToVisitTabState extends State<WantToVisitTab> {
  @override
  void initState() {
    super.initState();
    context.read<PlannedPlacesBloc>().add(PlannedPlacesLoad());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlannedPlacesBloc, PlannedPlacesState>(
      builder: (_, state) {
        if (state is PlannedPlacesLoadSuccess) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return AspectRatio(
                aspectRatio: 3 / 2,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width),
                  child: SightCard.wantToVisit(
                    key: ValueKey(state.placesList[index].name),
                    place: state.placesList[index],
                    onRemoveCard: () => context
                        .read<PlannedPlacesBloc>()
                        .add(PlannedPlacesRemovePlace(state.placesList[index])),
                    onReorderCard: () => context
                        .read<PlannedPlacesBloc>()
                        .add(PlannedPlacesLoad()),
                    onDismissedCard: () => context
                        .read<PlannedPlacesBloc>()
                        .add(PlannedPlacesRemovePlace(state.placesList[index])),
                  ),
                ),
              );
            },
            itemCount: state.placesList.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
          );
        } else if (state is PlannedPlacesLoadInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return const EmptyVisitScreen(
          icon: card,
          text: markPlaces,
        );
      },
    );
  }
}
