import 'package:dartz/dartz.dart';
import 'package:moteis_go/core/data/network/errors/failure.dart';
import 'package:moteis_go/features/home/data/models/motel_data.dart';

abstract class MotelsRemoteDataSource {
  Future<Either<Failure, MotelData>> getMotelsFromRemote();
}
