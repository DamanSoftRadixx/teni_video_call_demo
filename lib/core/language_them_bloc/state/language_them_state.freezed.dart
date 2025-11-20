// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'language_them_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LanguageThemState {
  LanguageTypes get languageCode => throw _privateConstructorUsedError;
  bool get isLoggedIn => throw _privateConstructorUsedError;
  ThemeEvent get themeEvent => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LanguageThemStateCopyWith<LanguageThemState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguageThemStateCopyWith<$Res> {
  factory $LanguageThemStateCopyWith(
          LanguageThemState value, $Res Function(LanguageThemState) then) =
      _$LanguageThemStateCopyWithImpl<$Res, LanguageThemState>;
  @useResult
  $Res call(
      {LanguageTypes languageCode, bool isLoggedIn, ThemeEvent themeEvent});
}

/// @nodoc
class _$LanguageThemStateCopyWithImpl<$Res, $Val extends LanguageThemState>
    implements $LanguageThemStateCopyWith<$Res> {
  _$LanguageThemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageCode = null,
    Object? isLoggedIn = null,
    Object? themeEvent = null,
  }) {
    return _then(_value.copyWith(
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as LanguageTypes,
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      themeEvent: null == themeEvent
          ? _value.themeEvent
          : themeEvent // ignore: cast_nullable_to_non_nullable
              as ThemeEvent,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LanguageThemStateImplCopyWith<$Res>
    implements $LanguageThemStateCopyWith<$Res> {
  factory _$$LanguageThemStateImplCopyWith(_$LanguageThemStateImpl value,
          $Res Function(_$LanguageThemStateImpl) then) =
      __$$LanguageThemStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LanguageTypes languageCode, bool isLoggedIn, ThemeEvent themeEvent});
}

/// @nodoc
class __$$LanguageThemStateImplCopyWithImpl<$Res>
    extends _$LanguageThemStateCopyWithImpl<$Res, _$LanguageThemStateImpl>
    implements _$$LanguageThemStateImplCopyWith<$Res> {
  __$$LanguageThemStateImplCopyWithImpl(_$LanguageThemStateImpl _value,
      $Res Function(_$LanguageThemStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageCode = null,
    Object? isLoggedIn = null,
    Object? themeEvent = null,
  }) {
    return _then(_$LanguageThemStateImpl(
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as LanguageTypes,
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      themeEvent: null == themeEvent
          ? _value.themeEvent
          : themeEvent // ignore: cast_nullable_to_non_nullable
              as ThemeEvent,
    ));
  }
}

/// @nodoc

class _$LanguageThemStateImpl implements _LanguageThemState {
  const _$LanguageThemStateImpl(
      {this.languageCode = LanguageTypes.en,
      this.isLoggedIn = false,
      this.themeEvent = ThemeEvent.toggleDark});

  @override
  @JsonKey()
  final LanguageTypes languageCode;
  @override
  @JsonKey()
  final bool isLoggedIn;
  @override
  @JsonKey()
  final ThemeEvent themeEvent;

  @override
  String toString() {
    return 'LanguageThemState(languageCode: $languageCode, isLoggedIn: $isLoggedIn, themeEvent: $themeEvent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LanguageThemStateImpl &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode) &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn) &&
            (identical(other.themeEvent, themeEvent) ||
                other.themeEvent == themeEvent));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, languageCode, isLoggedIn, themeEvent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LanguageThemStateImplCopyWith<_$LanguageThemStateImpl> get copyWith =>
      __$$LanguageThemStateImplCopyWithImpl<_$LanguageThemStateImpl>(
          this, _$identity);
}

abstract class _LanguageThemState implements LanguageThemState {
  const factory _LanguageThemState(
      {final LanguageTypes languageCode,
      final bool isLoggedIn,
      final ThemeEvent themeEvent}) = _$LanguageThemStateImpl;

  @override
  LanguageTypes get languageCode;
  @override
  bool get isLoggedIn;
  @override
  ThemeEvent get themeEvent;
  @override
  @JsonKey(ignore: true)
  _$$LanguageThemStateImplCopyWith<_$LanguageThemStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
