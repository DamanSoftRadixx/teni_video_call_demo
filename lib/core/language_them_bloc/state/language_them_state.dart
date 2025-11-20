import 'package:freezed_annotation/freezed_annotation.dart';
import '../bloc/language_them_bloc.dart';
part 'language_them_state.freezed.dart';

@freezed
sealed class LanguageThemState with _$LanguageThemState {
  const factory LanguageThemState({
    @Default(LanguageTypes.en) LanguageTypes languageCode,
    @Default(false) bool isLoggedIn,
    @Default(ThemeEvent.toggleDark) ThemeEvent themeEvent,
  }) = _LanguageThemState;
}
