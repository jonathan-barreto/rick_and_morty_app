import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/app/core/errors/exceptions.dart';
import 'package:rick_and_morty_app/app/core/http_client/http_client.dart';

class HttpClientImpl implements HttpClient {
  final Dio _dio;

  HttpClientImpl({required Dio dio}) : _dio = dio;

  @override
  Future<HttpResponse> get({required String endpoint}) async {
    try {
      final Response response = await _dio.get(endpoint);
      return HttpResponse(data: response.data);
    } on DioException catch (err) {
      throw HttpException.prepare(err);
    } catch (e) {
      throw UnexpectedException(message: e.toString());
    }
  }

  @override
  Future<HttpResponse> post({required String endpoint, required body}) async {
    try {
      final Response response = await _dio.post(endpoint, data: body);
      return HttpResponse(data: response.data);
    } on DioException catch (err) {
      throw HttpException.prepare(err);
    } catch (e) {
      throw UnexpectedException(message: e.toString());
    }
  }

  @override
  Future<HttpResponse> put({required String endpoint, required body}) async {
    try {
      final Response response = await _dio.put(endpoint, data: body);
      return HttpResponse(data: response.data);
    } on DioException catch (err) {
      throw HttpException.prepare(err);
    } catch (e) {
      throw UnexpectedException(message: e.toString());
    }
  }

  @override
  Future<HttpResponse> patch({required String endpoint, required body}) async {
    try {
      final Response response = await _dio.patch(endpoint, data: body);
      return HttpResponse(data: response.data);
    } on DioException catch (err) {
      throw HttpException.prepare(err);
    } catch (e) {
      throw UnexpectedException(message: e.toString());
    }
  }
}
