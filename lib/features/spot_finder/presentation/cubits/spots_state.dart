part of 'spots_cubit.dart';

sealed class SpotsState {
  SpotsState();
}

class SpotInitialState extends SpotsState {
  SpotInitialState();
}

class SpotsLoading extends SpotsState {
  SpotsLoading();
}

class LoadedSpots extends SpotsState {
  List<SpotEntity> spots;
  LoadedSpots({required this.spots});
}

class SpotError extends SpotsState {
  SpotError();
}