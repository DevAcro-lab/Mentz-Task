import 'package:fpdart/fpdart.dart';
import 'package:mentz_task/core/errors/failure.dart';
import 'package:mentz_task/features/spot_finder/domain/entities/spot_entity.dart';
import 'package:mentz_task/features/spot_finder/domain/repository/spot_repository.dart';

class GetSpotUseCase {
  final SpotRepository spotRepository;
  GetSpotUseCase({required this.spotRepository});

  Future<Either<Failure, List<SpotEntity>>> call({String searchQuery = ''}) async {
    return await spotRepository.getSpots(searchQuery: searchQuery);
}
}