import 'package:dartz/dartz.dart';
import 'package:moteis_go/core/data/network/errors/failure.dart';
import 'package:moteis_go/features/home/data/datasource/remote/motels_remote_datasource.dart';
import 'package:moteis_go/features/home/data/models.dart';
import 'package:moteis_go/features/home/domain/repositories/motels_repository.dart';

class MotelsRepositoryImpl implements MotelsRepository {
  final MotelsRemoteDataSource _dataSource;

  MotelsRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, MotelDataEntity>> getMotels() async {
    final result = await _dataSource.getMotelsFromRemote();
    return result.fold(
      (error) => Left(error),
      (motelData) => Right(motelData.toEntity()),
    );
  }
}
