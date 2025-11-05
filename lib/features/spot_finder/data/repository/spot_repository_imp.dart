import 'package:flutter/cupertino.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mentz_task/core/errors/failure.dart';
import 'package:mentz_task/features/spot_finder/data/models/spot_model.dart';
import 'package:mentz_task/features/spot_finder/domain/entities/spot_entity.dart';
import '../../domain/repository/spot_repository.dart';
import '../datasource/spot_datasource.dart';

class SpotRepositoryImplementation implements SpotRepository{
  SpotRemoteDatasource spotRemoteDatasource;
  SpotRepositoryImplementation({required this.spotRemoteDatasource});

  @override
  Future<Either<Failure, List<SpotEntity>>> getSpots({String searchQuery = ''}) async {
    try {
      final spots = await spotRemoteDatasource.getSpots(name_sf: searchQuery.isEmpty ? null : searchQuery);
      debugPrint("SPOTS: $spots");
      final data = spots
          .whereType<Map>()
          .map((spot) => SpotModel.fromMap(Map<String, dynamic>.from(spot)))
          .toList();
      return Right(data);
    } on Failure catch(e) {
      debugPrint("Failure Catching error ${e.toString()}");
      return Left(Failure(errorMsg: e.errorMsg));
    } catch(e){
      debugPrint("Catching error ${e.toString()}");
      return Left(Failure());
    }
  }

}