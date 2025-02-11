import 'package:dartz/dartz.dart';
import 'package:moteis_go/core/data/network/errors/failure.dart';
import 'package:moteis_go/features/home/domain/entities/motel_data_entity.dart';
import 'package:moteis_go/features/home/domain/repositories/motels_repository.dart';
import 'package:moteis_go/features/home/domain/usecases/get_motels_usecases.dart';

class GetMotelsUsecasesImpl implements GetMotelsUsecases {
  final MotelsRepository repository;

  GetMotelsUsecasesImpl(this.repository);

  @override
  Future<Either<Failure, MotelDataEntity>> invoke() async {
    return repository.getMotels();
  }
}
