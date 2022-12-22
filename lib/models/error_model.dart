abstract class ErrorModel {
  final String message;

  ErrorModel(this.message);
}

class RequestError extends ErrorModel {
  @override
  String message;

  RequestError({required this.message}) : super(message);
}

class HttpError extends ErrorModel {
  @override
  String message;

  HttpError({required this.message}) : super(message);
}
