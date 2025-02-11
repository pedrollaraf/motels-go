import 'package:dartz/dartz.dart';
import 'package:logger/web.dart';
import 'dart:convert' as convert;
import 'package:moteis_go/common/constants/urls_enviroment.dart';
import 'package:moteis_go/core/data/network/errors/failure.dart';
import 'package:moteis_go/core/data/network/service/api_service.dart';
import 'package:moteis_go/core/data/network/service/request_service.dart';
import 'package:moteis_go/features/home/data/models/motel_response.dart';
import 'package:moteis_go/features/home/domain/entities/motel_data_entity.dart';
import 'package:moteis_go/features/home/domain/repositories/get_motels_repository.dart';

class GetMotelsRepositoryImpl implements GetMotelsRepository {
  final ApiService _service;
  final Logger _logger;

  GetMotelsRepositoryImpl(
    this._service,
    this._logger,
  );

  @override
  Future<Either<Failure, MotelDataEntity>> getMotels() async {
    return onRequest(
      () async {
        final response = await _service.get("$baseUrl/e728bb91e0cd56cc0711");
        var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
        _logger.d(response.body);
        final obj = MotelResponse.fromJson(jsonResponse);
        return obj.data.toEntity();
      },
      _logger,
    );
  }
}
