import 'package:dio/dio.dart';

enum HttpExceptionType {
  connection,
  authentication,
  notFound,
  serverError,
  generic,
}

class HttpException implements Exception {
  final HttpExceptionType type;
  final String? message;

  HttpException({required this.type, this.message});

  factory HttpException.prepare(DioException err) {
    try {
      final errorMessage =
          err.response?.data['message'] ?? _getDefaultMessage(err);

      switch (err.type) {
        case DioExceptionType.badResponse:
          final statusCode = err.response?.statusCode;
          if (statusCode == 401 || statusCode == 403) {
            return HttpException(
              type: HttpExceptionType.authentication,
              message: 'Não autorizado: $errorMessage',
            );
          }
          if (statusCode == 404) {
            return HttpException(
              type: HttpExceptionType.notFound,
              message: 'Recurso não encontrado: $errorMessage',
            );
          }
          if (statusCode != null && statusCode >= 500) {
            return HttpException(
              type: HttpExceptionType.serverError,
              message: 'Erro no servidor: $errorMessage',
            );
          }
          return HttpException(
            type: HttpExceptionType.generic,
            message: errorMessage,
          );

        case DioExceptionType.connectionError:
        case DioExceptionType.connectionTimeout:
          return HttpException(
            type: HttpExceptionType.connection,
            message: 'Erro de conexão: $errorMessage',
          );

        default:
          return HttpException(
            type: HttpExceptionType.generic,
            message: errorMessage,
          );
      }
    } catch (e) {
      return HttpException(
        type: HttpExceptionType.generic,
        message: 'Erro inesperado na requisição',
      );
    }
  }

  static String _getDefaultMessage(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
        return 'Não foi possível conectar ao servidor';
      case DioExceptionType.badResponse:
        return 'Erro na resposta do servidor';
      default:
        return 'Erro ao processar a requisição';
    }
  }
}

class UnexpectedException implements Exception {
  final String? message;

  UnexpectedException({required this.message});
}

class SecureStorageException implements Exception {
  final String? message;

  SecureStorageException({required this.message});
}
