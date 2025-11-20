// 📁 lib/core/network/api_helper.dart
import 'package:teni_video_call_demo/core/constants/app_strings.dart'
    show ErrorStrings;
import 'package:teni_video_call_demo/core/network/connection_checker.dart';
import 'package:dio/dio.dart';
import 'api_result.dart';
import 'dio_exception.dart' show DioExceptions;
import 'dio_client.dart';
import 'api_config.dart';
import 'requirest_type.dart' show RequestType;

class ApiHelper {
  final DioClient _dioClient;
  final ConnectionChecker connectionChecker;

  ApiHelper(this._dioClient, this.connectionChecker);

  Future<ApiResult<T>> request<T>({
    required String endPoint,
    required RequestType method,
    dynamic body,
    Map<String, dynamic>? queryParams,
    String? pathParams,
    T Function(dynamic data)? decoder,
    Map<String, String>? headers,
  }) async {
    if (!await connectionChecker.isConnected) {
      return Failure(ErrorStrings.socketException);
    }
    try {
      final dio = _dioClient.dio;

      final options = Options(
        headers: {...ApiConfig.headers, if (headers != null) ...headers},
      );
      Response response;
      String url = endPoint;
      if (pathParams != null && pathParams.isNotEmpty) {
        url = '$endPoint/$pathParams';
      }
      switch (method) {
        case RequestType.get:
          response = await dio.get(
            url,
            queryParameters: queryParams,
            options: options,
          );
          break;
        case RequestType.post:
          response = await dio.post(url, data: body, options: options);
          break;
        case RequestType.put:
          response = await dio.put(url, data: body, options: options);
          break;
        case RequestType.patch:
          response = await dio.patch(url, data: body, options: options);
          break;
        case RequestType.delete:
          response = await dio.delete(url, data: body, options: options);
          break;
      }

      // Explicitly handle non-2xx
      if (response.statusCode != null && response.statusCode! >= 400) {
        final errorMessage = DioExceptions().handleError(
          response.statusCode,
          response.data,
        );
        return Failure(errorMessage);
      }

      // Safe parsing
      try {
        final parsed =
            decoder != null ? decoder(response.data) : response.data as T;
        if (parsed == null) {
          return Failure(ErrorStrings.nullResponse);
        }
        return Success(parsed);
      } catch (e) {
        return Failure("${ErrorStrings.parsingError}: ${e.toString()}");
      }
    } on DioException catch (e) {
      final message = DioExceptions.fromDioError(e).toString();
      return Failure(message);
    } catch (e) {
      return Failure(
        "${ErrorStrings.unknownError}. Details: ${e.runtimeType}: ${e.toString()}",
      );
    }
  }
}
