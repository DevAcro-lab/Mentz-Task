import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:mentz_task/features/spot_finder/domain/usecase/get_spot_usecase.dart';

import '../../domain/entities/spot_entity.dart';

part 'spots_state.dart';

class SpotsCubit extends Cubit<SpotsState> {
  GetSpotUseCase getSpotUseCase;
  SpotsCubit({required this.getSpotUseCase}) : super(SpotInitialState());

  Future<void> getSpots({String searchQuery = ''}) async {
    emit(SpotsLoading());
    final result = await getSpotUseCase(searchQuery: searchQuery);
    debugPrint("Spots result: $result");
    result.fold(
            (err) => emit(SpotError()), (spots) => emit(LoadedSpots(spots: spots)));
  }
}
