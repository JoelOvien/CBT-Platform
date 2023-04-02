class AppException implements Exception {
  AppException([this.message]);
  final dynamic message;
  @override
  String toString() {
    return "$message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String message = ""]) : super(message);
}

class AppTimeoutException extends AppException {
  AppTimeoutException([String message = ""]) : super(message);
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message);
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message);
}

class InvalidTokenException extends AppException {
  InvalidTokenException([message]) : super(message);
}

class InvalidInputException extends AppException {
  InvalidInputException([String message = ""]) : super(message);
}

class ServerErrorException extends AppException {
  ServerErrorException([
    String message =
        "Oh no! We encountered an error and our technical staff have been automatically notified and will be looking into this with the utmost urgency.",
  ]) : super(message);
}

class TokenServerErrorException extends AppException {
  TokenServerErrorException([
    String message = "Session Expired",
  ]) : super(message);
}

class GeneralErrorException extends AppException {
  GeneralErrorException([
    String message =
        "Oh no! We encountered an error and our technical staff have been automatically notified and will be looking into this with the utmost urgency.",
  ]) : super(message);
}
