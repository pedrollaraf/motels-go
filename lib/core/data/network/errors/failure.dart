abstract class Failure implements Exception {
  String? get message;
  const Failure();
}

class ServerErrorException extends Failure {
  @override
  String? message;
  ServerErrorException([this.message]);
}

class TimeoutException extends Failure {
  @override
  String? message;
  TimeoutException([this.message]);
}

class NoConnectionException extends Failure {
  @override
  String? message;
  int? statusCode;
  NoConnectionException([
    this.message,
    this.statusCode,
  ]);
}

class ClientRequestStateException extends Failure {
  @override
  String? message;
  int? statusCode;
  ClientRequestStateException([this.message, this.statusCode]);
}

class UnexpectedException extends Failure {
  @override
  String? message;
  int? statusCode;
  UnexpectedException([this.message, this.statusCode]);
}
