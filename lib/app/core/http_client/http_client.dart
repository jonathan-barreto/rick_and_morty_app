abstract class HttpClient {
  Future<HttpResponse> get({required String endpoint});

  Future<HttpResponse> post({
    required String endpoint,
    required dynamic body,
  });

  Future<HttpResponse> put({
    required String endpoint,
    required dynamic body,
  });

  Future<HttpResponse> patch({
    required String endpoint,
    required dynamic body,
  });
}

class HttpResponse {
  final dynamic data;

  HttpResponse({
    required this.data,
  });
}
