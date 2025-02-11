import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:moteis_go/core/data/network/errors/failure.dart';

Future<Either<Failure, T>> onRequest<T>(
  Future<T> Function() request,
  Logger logger,
  //AppStore dataBase,
) async {
  try {
    final response = await request();
    return Right(response);
    // if (response.statusCode == 401) {
    //   logger.e("Token expired - 401 : Returning to login");
    //   await dataBase.clearToken();
    //   final router = getIt.get<AppRouter>();
    //   final url = router.urlState.url;
    //   router.replaceAll([AuthRoute(onLogin: () => router.replaceNamed(url))]);
    //   return Left(TokenException("Token expirado", 401));
    // }

    // if (response.statusCode >= 200 && response.statusCode < 300) {
    //   final data = json.decode(response.body) as T;
    //   return Right(data);
    // } else {
    //   final error = _handleErrorResponse(response, logger);
    //   return Left(error);
    // }
  } on http.ClientException catch (e) {
    logger.e("Connection error: ${e.message}");
    return Left(NoConnectionException("Erro de conexão", null));
  } on TimeoutException catch (e) {
    logger.e("Timeout error: ${e.message}");
    return Left(NoConnectionException("Timeout de conexão", null));
  } catch (e, stack) {
    logger.e("Unexpected error: $e", error: e, stackTrace: stack);
    return Left(UnexpectedException("Erro inesperado"));
  }
}

// Failure _handleErrorResponse(http.Response response, Logger logger) {
//   logger.e("Server error: ${response.statusCode} - ${response.body}");

//   try {
//     final errorData = json.decode(response.body);
//     final apiError = ApiError.fromMap(errorData, statusCode: response.statusCode);
//     return ServerErrorException(apiError.errorMessage);
//   } catch (e) {
//     return ServerErrorException("Erro no servidor: ${response.statusCode}");
//   }
// }
