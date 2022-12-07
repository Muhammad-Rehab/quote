import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:quotes/core/api/api_consumer.dart';
import 'package:quotes/core/api/end_points.dart';
import 'package:quotes/core/api/status_code.dart';
import 'package:quotes/core/errors/exceptions.dart';

class DioImplementation implements ApiConsumer
{
  Dio client ;
  DioImplementation({required this.client})
  {
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    client.options
    ..baseUrl = ApiEndPoints.baseUrl
    ..responseType = ResponseType.plain
    ..followRedirects = false
    ..validateStatus = (status)=> status! < StatusCode.internalServerError ;
  }

  @override
  Future get(String url, {Map<String, dynamic>? queryParams}) async
  {
    try
    {
      final response =await client.get(url ,queryParameters: queryParams);
      return json.decode(response.data.toString());
    }
    on DioError catch (e)
    {
      _handleDioError(e);
    }

  }

  @override
  Future post(String url, {Map<String, dynamic>? body, Map<String, dynamic>? queryParams}) async
  {
   final response = await client.post(
       url,
       queryParameters: queryParams,
      data: body,
   );
   return json.decode(response.data.toString());
  }

  _handleDioError(DioError e)
  {
    switch (e.type)
    {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw const FetchDataException();
      case DioErrorType.response:
        switch (e.response!.statusCode)
        {
          case StatusCode.unAuthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.conflict:
            throw const ConflictException();
          case StatusCode.internalServerError:
            throw const InternalServerErrorException();
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw const NoInternetConnectionException();
    }
  }

}
