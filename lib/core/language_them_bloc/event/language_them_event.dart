import 'package:freezed_annotation/freezed_annotation.dart';
import '../bloc/language_them_bloc.dart' show LanguageTypes, ThemeEvent;
part 'language_them_event.freezed.dart';

@freezed
sealed class LanguageThemEvent with _$LanguageThemEvent {
  const factory LanguageThemEvent.initial(
    LanguageTypes languageType,
    ThemeEvent isThemChange,
  ) = InitialEvent;

  const factory LanguageThemEvent.onChangeLanguage(LanguageTypes languageType) =
      ChangeLanguage;

  const factory LanguageThemEvent.isLoggedInStatusChanged(bool isLoggedIn) =
      IsLoggedInStatusChanged;

  const factory LanguageThemEvent.isThemStatusChanged(bool isThemChange) =
      IsThemStatusChanged;
}
