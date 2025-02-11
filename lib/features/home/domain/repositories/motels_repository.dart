import 'package:dartz/dartz.dart';
import 'package:moteis_go/core/data/network/errors/failure.dart';
import 'package:moteis_go/features/home/data/models.dart';

abstract class MotelsRepository {
  Future<Either<Failure, MotelDataEntity>> getMotels();
}
