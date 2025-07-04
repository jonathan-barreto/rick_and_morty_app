import 'package:rick_and_morty_app/app/core/errors/exceptions.dart';

enum FailureType { connection, authentication, notFound, serverError, generic }

class Failure {
  final FailureType? typeError;
  final String? message;

  const Failure({ this.typeError, this.message});

  factory Failure.fromHttpException(HttpException err) {
    switch (err.type) {
      case HttpExceptionType.authentication:
        return Failure(
          typeError: FailureType.authentication,
          message: err.message,
        );

      case HttpExceptionType.connection:
        return Failure(typeError: FailureType.connection, message: err.message);

      case HttpExceptionType.notFound:
        return Failure(typeError: FailureType.notFound, message: err.message);

      case HttpExceptionType.serverError:
        return Failure(
          typeError: FailureType.serverError,
          message: err.message,
        );

      case HttpExceptionType.generic:
        return Failure(typeError: FailureType.generic, message: err.message);
    }
  }

  factory Failure.fromUnexpectedException(UnexpectedException err) {
    return Failure(
      typeError: FailureType.generic,
      message: err.message ?? 'Erro inesperado',
    );
  }

  factory Failure.fromSecureStorageException(SecureStorageException err) {
    return Failure(
      typeError: FailureType.generic,
      message: err.message ?? 'Erro ao acessar armazenamento seguro',
    );
  }
}
