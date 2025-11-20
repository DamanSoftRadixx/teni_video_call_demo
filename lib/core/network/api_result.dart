// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'api_result.freezed.dart';

// @freezed
// class ApiResult<T> with _$ApiResult<T> {
//   const factory ApiResult.success(T data) = Success<T>;
//   const factory ApiResult.failure(String error) = Failure;
// }



abstract class ApiResult<T> {
  const ApiResult();
}

class Success<T> extends ApiResult<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends ApiResult<T> {
  final String message;
  const Failure(this.message);
}