// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_calling_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VideoCallingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() success,
    required TResult Function(String error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialEvent value) initial,
    required TResult Function(SuccessEvent value) success,
    required TResult Function(FailureEvent value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialEvent value)? initial,
    TResult? Function(SuccessEvent value)? success,
    TResult? Function(FailureEvent value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialEvent value)? initial,
    TResult Function(SuccessEvent value)? success,
    TResult Function(FailureEvent value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoCallingStateCopyWith<$Res> {
  factory $VideoCallingStateCopyWith(
          VideoCallingState value, $Res Function(VideoCallingState) then) =
      _$VideoCallingStateCopyWithImpl<$Res, VideoCallingState>;
}

/// @nodoc
class _$VideoCallingStateCopyWithImpl<$Res, $Val extends VideoCallingState>
    implements $VideoCallingStateCopyWith<$Res> {
  _$VideoCallingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialEventImplCopyWith<$Res> {
  factory _$$InitialEventImplCopyWith(
          _$InitialEventImpl value, $Res Function(_$InitialEventImpl) then) =
      __$$InitialEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialEventImplCopyWithImpl<$Res>
    extends _$VideoCallingStateCopyWithImpl<$Res, _$InitialEventImpl>
    implements _$$InitialEventImplCopyWith<$Res> {
  __$$InitialEventImplCopyWithImpl(
      _$InitialEventImpl _value, $Res Function(_$InitialEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialEventImpl implements InitialEvent {
  const _$InitialEventImpl();

  @override
  String toString() {
    return 'VideoCallingState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() success,
    required TResult Function(String error) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialEvent value) initial,
    required TResult Function(SuccessEvent value) success,
    required TResult Function(FailureEvent value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialEvent value)? initial,
    TResult? Function(SuccessEvent value)? success,
    TResult? Function(FailureEvent value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialEvent value)? initial,
    TResult Function(SuccessEvent value)? success,
    TResult Function(FailureEvent value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialEvent implements VideoCallingState {
  const factory InitialEvent() = _$InitialEventImpl;
}

/// @nodoc
abstract class _$$SuccessEventImplCopyWith<$Res> {
  factory _$$SuccessEventImplCopyWith(
          _$SuccessEventImpl value, $Res Function(_$SuccessEventImpl) then) =
      __$$SuccessEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessEventImplCopyWithImpl<$Res>
    extends _$VideoCallingStateCopyWithImpl<$Res, _$SuccessEventImpl>
    implements _$$SuccessEventImplCopyWith<$Res> {
  __$$SuccessEventImplCopyWithImpl(
      _$SuccessEventImpl _value, $Res Function(_$SuccessEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessEventImpl implements SuccessEvent {
  const _$SuccessEventImpl();

  @override
  String toString() {
    return 'VideoCallingState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() success,
    required TResult Function(String error) failure,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialEvent value) initial,
    required TResult Function(SuccessEvent value) success,
    required TResult Function(FailureEvent value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialEvent value)? initial,
    TResult? Function(SuccessEvent value)? success,
    TResult? Function(FailureEvent value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialEvent value)? initial,
    TResult Function(SuccessEvent value)? success,
    TResult Function(FailureEvent value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessEvent implements VideoCallingState {
  const factory SuccessEvent() = _$SuccessEventImpl;
}

/// @nodoc
abstract class _$$FailureEventImplCopyWith<$Res> {
  factory _$$FailureEventImplCopyWith(
          _$FailureEventImpl value, $Res Function(_$FailureEventImpl) then) =
      __$$FailureEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$FailureEventImplCopyWithImpl<$Res>
    extends _$VideoCallingStateCopyWithImpl<$Res, _$FailureEventImpl>
    implements _$$FailureEventImplCopyWith<$Res> {
  __$$FailureEventImplCopyWithImpl(
      _$FailureEventImpl _value, $Res Function(_$FailureEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$FailureEventImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailureEventImpl implements FailureEvent {
  const _$FailureEventImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'VideoCallingState.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureEventImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureEventImplCopyWith<_$FailureEventImpl> get copyWith =>
      __$$FailureEventImplCopyWithImpl<_$FailureEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() success,
    required TResult Function(String error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialEvent value) initial,
    required TResult Function(SuccessEvent value) success,
    required TResult Function(FailureEvent value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialEvent value)? initial,
    TResult? Function(SuccessEvent value)? success,
    TResult? Function(FailureEvent value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialEvent value)? initial,
    TResult Function(SuccessEvent value)? success,
    TResult Function(FailureEvent value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class FailureEvent implements VideoCallingState {
  const factory FailureEvent(final String error) = _$FailureEventImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$FailureEventImplCopyWith<_$FailureEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
