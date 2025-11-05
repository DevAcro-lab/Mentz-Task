import 'package:get_it/get_it.dart';

import '../../../features/spot_finder/data/datasource/spot_datasource.dart';
import '../../../features/spot_finder/data/repository/spot_repository_imp.dart';
import '../../../features/spot_finder/domain/repository/spot_repository.dart';
import '../../../features/spot_finder/domain/usecase/get_spot_usecase.dart';
import '../../../features/spot_finder/presentation/cubits/spots_cubit.dart';

class SpotServiceLocator {
  final GetIt sl;
  SpotServiceLocator(this.sl);

  void init() {
    sl.registerSingleton<SpotRemoteDatasource>(SpotRemoteDatasource(),
        instanceName: 'spotRemoteDatasource');

    sl.registerSingleton<SpotRepository>(
        SpotRepositoryImplementation(
            spotRemoteDatasource: sl(instanceName: "spotRemoteDatasource")),
        instanceName: 'spotRepositoryImplementation');

    sl.registerSingleton<GetSpotUseCase>(
        GetSpotUseCase(
            spotRepository: sl(instanceName: "spotRepositoryImplementation")),
        instanceName: "getSpotUseCase");

    sl.registerSingleton<SpotsCubit>(
        SpotsCubit(
          getSpotUseCase: sl(instanceName: "getSpotUseCase"),
        ),
        instanceName: "spotsCubit");
  }
}