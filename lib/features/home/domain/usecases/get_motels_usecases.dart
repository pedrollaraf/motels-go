import 'package:moteis_go/core/data/network/errors/failure.dart';
import 'package:moteis_go/features/home/domain/entities/motel_data_entity.dart';
import 'package:dartz/dartz.dart';

abstract class GetMotelsUsecases {
  Future<Either<Failure, MotelDataEntity>> invoke();
}
