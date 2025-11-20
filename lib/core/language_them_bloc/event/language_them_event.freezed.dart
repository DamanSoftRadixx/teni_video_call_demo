// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'language_them_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LanguageThemEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            LanguageTypes languageType, ThemeEvent isThemChange)
        initial,
    required TResult Function(LanguageTypes languageType) onChangeLanguage,
    required TResult Function(bool isLoggedIn) isLoggedInStatusChanged,
    required TResult Function(bool isThemChange) isThemStatusChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LanguageTypes languageType, ThemeEvent isThemChange)?
        initial,
    TResult? Function(LanguageTypes languageType)? onChangeLanguage,
    TResult? Function(bool isLoggedIn)? isLoggedInStatusChanged,
    TResult? Function(bool isThemChange)? isThemStatusChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LanguageTypes languageType, ThemeEvent isThemChange)?
        initial,
    TResult Function(LanguageTypes languageType)? onChangeLanguage,
    TResult Function(bool isLoggedIn)? isLoggedInStatusChanged,
    TResult Function(bool isThemChange)? isThemStatusChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialEvent value) initial,
    required TResult Function(ChangeLanguage value) onChangeLanguage,
    required TResult Function(IsLoggedInStatusChanged value)
        isLoggedInStatusChanged,
    required TResult Function(IsThemStatusChanged value) isThemStatusChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialEvent value)? initial,
    TResult? Function(ChangeLanguage value)? onChangeLanguage,
    TResult? Function(IsLoggedInStatusChanged value)? isLoggedInStatusChanged,
    TResult? Function(IsThemStatusChanged value)? isThemStatusChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialEvent value)? initial,
    TResult Function(ChangeLanguage value)? onChangeLanguage,
    TResult Function(IsLoggedInStatusChanged value)? isLoggedInStatusChanged,
    TResult Function(IsThemStatusChanged value)? isThemStatusChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguageThemEventCopyWith<$Res> {
  factory $LanguageThemEventCopyWith(
          LanguageThemEvent value, $Res Function(LanguageThemEvent) then) =
      _$LanguageThemEventCopyWithImpl<$Res, LanguageThemEvent>;
}

/// @nodoc
class _$LanguageThemEventCopyWithImpl<$Res, $Val extends LanguageThemEvent>
    implements $LanguageThemEventCopyWith<$Res> {
  _$LanguageThemEventCopyWithImpl(this._value, this._then);

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
  @useResult
  $Res call({LanguageTypes languageType, ThemeEvent isThemChange});
}

/// @nodoc
class __$$InitialEventImplCopyWithImpl<$Res>
    extends _$LanguageThemEventCopyWithImpl<$Res, _$InitialEventImpl>
    implements _$$InitialEventImplCopyWith<$Res> {
  __$$InitialEventImplCopyWithImpl(
      _$InitialEventImpl _value, $Res Function(_$InitialEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageType = null,
    Object? isThemChange = null,
  }) {
    return _then(_$InitialEventImpl(
      null == languageType
          ? _value.languageType
          : languageType // ignore: cast_nullable_to_non_nullable
              as LanguageTypes,
      null == isThemChange
          ? _value.isThemChange
          : isThemChange // ignore: cast_nullable_to_non_nullable
              as ThemeEvent,
    ));
  }
}

/// @nodoc

class _$InitialEventImpl implements InitialEvent {
  const _$InitialEventImpl(this.languageType, this.isThemChange);

  @override
  final LanguageTypes languageType;
  @override
  final ThemeEvent isThemChange;

  @override
  String toString() {
    return 'LanguageThemEvent.initial(languageType: $languageType, isThemChange: $isThemChange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialEventImpl &&
            (identical(other.languageType, languageType) ||
                other.languageType == languageType) &&
            (identical(other.isThemChange, isThemChange) ||
                other.isThemChange == isThemChange));
  }

  @override
  int get hashCode => Object.hash(runtimeType, languageType, isThemChange);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialEventImplCopyWith<_$InitialEventImpl> get copyWith =>
      __$$InitialEventImplCopyWithImpl<_$InitialEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            LanguageTypes languageType, ThemeEvent isThemChange)
        initial,
    required TResult Function(LanguageTypes languageType) onChangeLanguage,
    required TResult Function(bool isLoggedIn) isLoggedInStatusChanged,
    required TResult Function(bool isThemChange) isThemStatusChanged,
  }) {
    return initial(languageType, isThemChange);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LanguageTypes languageType, ThemeEvent isThemChange)?
        initial,
    TResult? Function(LanguageTypes languageType)? onChangeLanguage,
    TResult? Function(bool isLoggedIn)? isLoggedInStatusChanged,
    TResult? Function(bool isThemChange)? isThemStatusChanged,
  }) {
    return initial?.call(languageType, isThemChange);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LanguageTypes languageType, ThemeEvent isThemChange)?
        initial,
    TResult Function(LanguageTypes languageType)? onChangeLanguage,
    TResult Function(bool isLoggedIn)? isLoggedInStatusChanged,
    TResult Function(bool isThemChange)? isThemStatusChanged,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(languageType, isThemChange);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialEvent value) initial,
    required TResult Function(ChangeLanguage value) onChangeLanguage,
    required TResult Function(IsLoggedInStatusChanged value)
        isLoggedInStatusChanged,
    required TResult Function(IsThemStatusChanged value) isThemStatusChanged,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialEvent value)? initial,
    TResult? Function(ChangeLanguage value)? onChangeLanguage,
    TResult? Function(IsLoggedInStatusChanged value)? isLoggedInStatusChanged,
    TResult? Function(IsThemStatusChanged value)? isThemStatusChanged,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialEvent value)? initial,
    TResult Function(ChangeLanguage value)? onChangeLanguage,
    TResult Function(IsLoggedInStatusChanged value)? isLoggedInStatusChanged,
    TResult Function(IsThemStatusChanged value)? isThemStatusChanged,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialEvent implements LanguageThemEvent {
  const factory InitialEvent(
          final LanguageTypes languageType, final ThemeEvent isThemChange) =
      _$InitialEventImpl;

  LanguageTypes get languageType;
  ThemeEvent get isThemChange;
  @JsonKey(ignore: true)
  _$$InitialEventImplCopyWith<_$InitialEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeLanguageImplCopyWith<$Res> {
  factory _$$ChangeLanguageImplCopyWith(_$ChangeLanguageImpl value,
          $Res Function(_$ChangeLanguageImpl) then) =
      __$$ChangeLanguageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LanguageTypes languageType});
}

/// @nodoc
class __$$ChangeLanguageImplCopyWithImpl<$Res>
    extends _$LanguageThemEventCopyWithImpl<$Res, _$ChangeLanguageImpl>
    implements _$$ChangeLanguageImplCopyWith<$Res> {
  __$$ChangeLanguageImplCopyWithImpl(
      _$ChangeLanguageImpl _value, $Res Function(_$ChangeLanguageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageType = null,
  }) {
    return _then(_$ChangeLanguageImpl(
      null == languageType
          ? _value.languageType
          : languageType // ignore: cast_nullable_to_non_nullable
              as LanguageTypes,
    ));
  }
}

/// @nodoc

class _$ChangeLanguageImpl implements ChangeLanguage {
  const _$ChangeLanguageImpl(this.languageType);

  @override
  final LanguageTypes languageType;

  @override
  String toString() {
    return 'LanguageThemEvent.onChangeLanguage(languageType: $languageType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeLanguageImpl &&
            (identical(other.languageType, languageType) ||
                other.languageType == languageType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, languageType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeLanguageImplCopyWith<_$ChangeLanguageImpl> get copyWith =>
      __$$ChangeLanguageImplCopyWithImpl<_$ChangeLanguageImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            LanguageTypes languageType, ThemeEvent isThemChange)
        initial,
    required TResult Function(LanguageTypes languageType) onChangeLanguage,
    required TResult Function(bool isLoggedIn) isLoggedInStatusChanged,
    required TResult Function(bool isThemChange) isThemStatusChanged,
  }) {
    return onChangeLanguage(languageType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LanguageTypes languageType, ThemeEvent isThemChange)?
        initial,
    TResult? Function(LanguageTypes languageType)? onChangeLanguage,
    TResult? Function(bool isLoggedIn)? isLoggedInStatusChanged,
    TResult? Function(bool isThemChange)? isThemStatusChanged,
  }) {
    return onChangeLanguage?.call(languageType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LanguageTypes languageType, ThemeEvent isThemChange)?
        initial,
    TResult Function(LanguageTypes languageType)? onChangeLanguage,
    TResult Function(bool isLoggedIn)? isLoggedInStatusChanged,
    TResult Function(bool isThemChange)? isThemStatusChanged,
    required TResult orElse(),
  }) {
    if (onChangeLanguage != null) {
      return onChangeLanguage(languageType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialEvent value) initial,
    required TResult Function(ChangeLanguage value) onChangeLanguage,
    required TResult Function(IsLoggedInStatusChanged value)
        isLoggedInStatusChanged,
    required TResult Function(IsThemStatusChanged value) isThemStatusChanged,
  }) {
    return onChangeLanguage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialEvent value)? initial,
    TResult? Function(ChangeLanguage value)? onChangeLanguage,
    TResult? Function(IsLoggedInStatusChanged value)? isLoggedInStatusChanged,
    TResult? Function(IsThemStatusChanged value)? isThemStatusChanged,
  }) {
    return onChangeLanguage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialEvent value)? initial,
    TResult Function(ChangeLanguage value)? onChangeLanguage,
    TResult Function(IsLoggedInStatusChanged value)? isLoggedInStatusChanged,
    TResult Function(IsThemStatusChanged value)? isThemStatusChanged,
    required TResult orElse(),
  }) {
    if (onChangeLanguage != null) {
      return onChangeLanguage(this);
    }
    return orElse();
  }
}

abstract class ChangeLanguage implements LanguageThemEvent {
  const factory ChangeLanguage(final LanguageTypes languageType) =
      _$ChangeLanguageImpl;

  LanguageTypes get languageType;
  @JsonKey(ignore: true)
  _$$ChangeLanguageImplCopyWith<_$ChangeLanguageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IsLoggedInStatusChangedImplCopyWith<$Res> {
  factory _$$IsLoggedInStatusChangedImplCopyWith(
          _$IsLoggedInStatusChangedImpl value,
          $Res Function(_$IsLoggedInStatusChangedImpl) then) =
      __$$IsLoggedInStatusChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isLoggedIn});
}

/// @nodoc
class __$$IsLoggedInStatusChangedImplCopyWithImpl<$Res>
    extends _$LanguageThemEventCopyWithImpl<$Res, _$IsLoggedInStatusChangedImpl>
    implements _$$IsLoggedInStatusChangedImplCopyWith<$Res> {
  __$$IsLoggedInStatusChangedImplCopyWithImpl(
      _$IsLoggedInStatusChangedImpl _value,
      $Res Function(_$IsLoggedInStatusChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoggedIn = null,
  }) {
    return _then(_$IsLoggedInStatusChangedImpl(
      null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$IsLoggedInStatusChangedImpl implements IsLoggedInStatusChanged {
  const _$IsLoggedInStatusChangedImpl(this.isLoggedIn);

  @override
  final bool isLoggedIn;

  @override
  String toString() {
    return 'LanguageThemEvent.isLoggedInStatusChanged(isLoggedIn: $isLoggedIn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsLoggedInStatusChangedImpl &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoggedIn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IsLoggedInStatusChangedImplCopyWith<_$IsLoggedInStatusChangedImpl>
      get copyWith => __$$IsLoggedInStatusChangedImplCopyWithImpl<
          _$IsLoggedInStatusChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            LanguageTypes languageType, ThemeEvent isThemChange)
        initial,
    required TResult Function(LanguageTypes languageType) onChangeLanguage,
    required TResult Function(bool isLoggedIn) isLoggedInStatusChanged,
    required TResult Function(bool isThemChange) isThemStatusChanged,
  }) {
    return isLoggedInStatusChanged(isLoggedIn);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LanguageTypes languageType, ThemeEvent isThemChange)?
        initial,
    TResult? Function(LanguageTypes languageType)? onChangeLanguage,
    TResult? Function(bool isLoggedIn)? isLoggedInStatusChanged,
    TResult? Function(bool isThemChange)? isThemStatusChanged,
  }) {
    return isLoggedInStatusChanged?.call(isLoggedIn);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LanguageTypes languageType, ThemeEvent isThemChange)?
        initial,
    TResult Function(LanguageTypes languageType)? onChangeLanguage,
    TResult Function(bool isLoggedIn)? isLoggedInStatusChanged,
    TResult Function(bool isThemChange)? isThemStatusChanged,
    required TResult orElse(),
  }) {
    if (isLoggedInStatusChanged != null) {
      return isLoggedInStatusChanged(isLoggedIn);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialEvent value) initial,
    required TResult Function(ChangeLanguage value) onChangeLanguage,
    required TResult Function(IsLoggedInStatusChanged value)
        isLoggedInStatusChanged,
    required TResult Function(IsThemStatusChanged value) isThemStatusChanged,
  }) {
    return isLoggedInStatusChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialEvent value)? initial,
    TResult? Function(ChangeLanguage value)? onChangeLanguage,
    TResult? Function(IsLoggedInStatusChanged value)? isLoggedInStatusChanged,
    TResult? Function(IsThemStatusChanged value)? isThemStatusChanged,
  }) {
    return isLoggedInStatusChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialEvent value)? initial,
    TResult Function(ChangeLanguage value)? onChangeLanguage,
    TResult Function(IsLoggedInStatusChanged value)? isLoggedInStatusChanged,
    TResult Function(IsThemStatusChanged value)? isThemStatusChanged,
    required TResult orElse(),
  }) {
    if (isLoggedInStatusChanged != null) {
      return isLoggedInStatusChanged(this);
    }
    return orElse();
  }
}

abstract class IsLoggedInStatusChanged implements LanguageThemEvent {
  const factory IsLoggedInStatusChanged(final bool isLoggedIn) =
      _$IsLoggedInStatusChangedImpl;

  bool get isLoggedIn;
  @JsonKey(ignore: true)
  _$$IsLoggedInStatusChangedImplCopyWith<_$IsLoggedInStatusChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IsThemStatusChangedImplCopyWith<$Res> {
  factory _$$IsThemStatusChangedImplCopyWith(_$IsThemStatusChangedImpl value,
          $Res Function(_$IsThemStatusChangedImpl) then) =
      __$$IsThemStatusChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isThemChange});
}

/// @nodoc
class __$$IsThemStatusChangedImplCopyWithImpl<$Res>
    extends _$LanguageThemEventCopyWithImpl<$Res, _$IsThemStatusChangedImpl>
    implements _$$IsThemStatusChangedImplCopyWith<$Res> {
  __$$IsThemStatusChangedImplCopyWithImpl(_$IsThemStatusChangedImpl _value,
      $Res Function(_$IsThemStatusChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isThemChange = null,
  }) {
    return _then(_$IsThemStatusChangedImpl(
      null == isThemChange
          ? _value.isThemChange
          : isThemChange // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$IsThemStatusChangedImpl implements IsThemStatusChanged {
  const _$IsThemStatusChangedImpl(this.isThemChange);

  @override
  final bool isThemChange;

  @override
  String toString() {
    return 'LanguageThemEvent.isThemStatusChanged(isThemChange: $isThemChange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsThemStatusChangedImpl &&
            (identical(other.isThemChange, isThemChange) ||
                other.isThemChange == isThemChange));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isThemChange);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IsThemStatusChangedImplCopyWith<_$IsThemStatusChangedImpl> get copyWith =>
      __$$IsThemStatusChangedImplCopyWithImpl<_$IsThemStatusChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            LanguageTypes languageType, ThemeEvent isThemChange)
        initial,
    required TResult Function(LanguageTypes languageType) onChangeLanguage,
    required TResult Function(bool isLoggedIn) isLoggedInStatusChanged,
    required TResult Function(bool isThemChange) isThemStatusChanged,
  }) {
    return isThemStatusChanged(isThemChange);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LanguageTypes languageType, ThemeEvent isThemChange)?
        initial,
    TResult? Function(LanguageTypes languageType)? onChangeLanguage,
    TResult? Function(bool isLoggedIn)? isLoggedInStatusChanged,
    TResult? Function(bool isThemChange)? isThemStatusChanged,
  }) {
    return isThemStatusChanged?.call(isThemChange);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LanguageTypes languageType, ThemeEvent isThemChange)?
        initial,
    TResult Function(LanguageTypes languageType)? onChangeLanguage,
    TResult Function(bool isLoggedIn)? isLoggedInStatusChanged,
    TResult Function(bool isThemChange)? isThemStatusChanged,
    required TResult orElse(),
  }) {
    if (isThemStatusChanged != null) {
      return isThemStatusChanged(isThemChange);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialEvent value) initial,
    required TResult Function(ChangeLanguage value) onChangeLanguage,
    required TResult Function(IsLoggedInStatusChanged value)
        isLoggedInStatusChanged,
    required TResult Function(IsThemStatusChanged value) isThemStatusChanged,
  }) {
    return isThemStatusChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialEvent value)? initial,
    TResult? Function(ChangeLanguage value)? onChangeLanguage,
    TResult? Function(IsLoggedInStatusChanged value)? isLoggedInStatusChanged,
    TResult? Function(IsThemStatusChanged value)? isThemStatusChanged,
  }) {
    return isThemStatusChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialEvent value)? initial,
    TResult Function(ChangeLanguage value)? onChangeLanguage,
    TResult Function(IsLoggedInStatusChanged value)? isLoggedInStatusChanged,
    TResult Function(IsThemStatusChanged value)? isThemStatusChanged,
    required TResult orElse(),
  }) {
    if (isThemStatusChanged != null) {
      return isThemStatusChanged(this);
    }
    return orElse();
  }
}

abstract class IsThemStatusChanged implements LanguageThemEvent {
  const factory IsThemStatusChanged(final bool isThemChange) =
      _$IsThemStatusChangedImpl;

  bool get isThemChange;
  @JsonKey(ignore: true)
  _$$IsThemStatusChangedImplCopyWith<_$IsThemStatusChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
