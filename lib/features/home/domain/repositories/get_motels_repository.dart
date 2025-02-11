import 'package:dartz/dartz.dart';
import 'package:moteis_go/core/data/network/errors/failure.dart';
import 'package:moteis_go/features/home/domain/entities/motel_data_entity.dart';

abstract class GetMotelsRepository {
  Future<Either<Failure, MotelDataEntity>> getMotels();
}
