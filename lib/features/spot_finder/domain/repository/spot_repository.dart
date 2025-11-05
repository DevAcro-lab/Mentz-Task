
import 'package:fpdart/fpdart.dart';
import 'package:mentz_task/core/errors/failure.dart';
import 'package:mentz_task/features/spot_finder/domain/entities/spot_entity.dart';

abstract interface class SpotRepository {
  Future<Either<Failure, List<SpotEntity>>> getSpots({String searchQuery = ''});
}