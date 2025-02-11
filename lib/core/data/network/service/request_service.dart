import 'package:dartz/dartz.dart';
import 'package:logger/web.dart';
import 'package:http/http.dart' as http;
import 'package:moteis_go/core/data/network/errors/failure.dart';

Future<Either<Failure, T>> onRequest<T>(
  Future<T> Function() request,
  Logger logger,
) async {
  try {
    final response = await request();
    return Right(response);
  } on http.ClientException catch (e) {
    logger.e("Connection error: ${e.message}");
    return Left(NoConnectionException("Erro de conexão", null));
  } on TimeoutException catch (e) {
    logger.e("Timeout error: ${e.message}");
    return Left(NoConnectionException("Timeout de conexão", null));
  } on ServerErrorException catch (e) {
    logger.e("Server error: ${e.message}");
    return Left(ServerErrorException(e.message));
  } catch (e, stack) {
    logger.e("Unexpected error: $e", error: e, stackTrace: stack);
    return Left(UnexpectedException("Erro inesperado"));
  }
}
