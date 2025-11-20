import 'package:equatable/equatable.dart';
import 'package:teni_video_call_demo/feature/login/domain/entities/user.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object?> get props => [];
}

class PreConfigureValuesEvent extends LoginEvent {
  final RefreshTokenDetail refreshTokenDetail;
  const PreConfigureValuesEvent({required this.refreshTokenDetail});

  @override
  List<Object?> get props => [refreshTokenDetail];
}

class ResetTokenEvent extends LoginEvent {
  final String hostUrl;
  final String token;
  final String roomName;
  final String participantName;

  const ResetTokenEvent({
    required this.hostUrl,
    required this.token,
    required this.roomName,
    required this.participantName,
  });

  @override
  List<Object?> get props => [hostUrl, token, roomName, participantName];
}

class GenerateTokenLoginEvent extends LoginEvent {
  final String roomName;
  final String participantName;

  const GenerateTokenLoginEvent({
    required this.roomName,
    required this.participantName,
  });

  @override
  List<Object?> get props => [roomName, participantName];
}

class JoinVideoCallLoginEvent extends LoginEvent {
  final String hostUrl;
  final String token;
  final String roomName;
  final String participantName;

  const JoinVideoCallLoginEvent({
    required this.hostUrl,
    required this.token,
    required this.roomName,
    required this.participantName,
  });

  @override
  List<Object?> get props => [hostUrl, token, roomName, participantName];
}


// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'login_event.freezed.dart';

// @freezed
// class LoginEvent with _$LoginEvent {
//   const factory LoginEvent.emailPasswordSubmitted({
//     required String email,
//     required String password,
//   }) = EmailPasswordSubmitted;
// }


// 🟨 TL;DR Decision Guide:
// Requirement	Use Equatable ✅	Use Freezed ✅
// Basic value comparison only	✅	✅
// Avoiding code generation	✅	❌
// Need copyWith, toString, etc.	❌ (manual)	✅
// Multiple named constructors (union types)	❌	✅
// Enforced immutability	❌ (by convention)	✅
// BLoC events (simple)	✅	✅ (overkill sometimes)
// BLoC state (complex, many fields/types)	❌	✅
// Need JSON serialization	❌ (manual)	✅

// 🧠 Final Tip:
// Use Equatable for small/simple classes where you just need value equality.

// Use Freezed for large/complex models or states, where immutability, unions, and clean code are needed.


// dependencies:
//   freezed_annotation: ^2.4.1

// dev_dependencies:
//   build_runner: ^2.4.6
//   freezed: ^2.4.6






// UI (email, password)
//     ↓
// LoginRequestModel → API
//     ↓
// Response JSON → UserModel
//     ↓
// UserModel (extends User) → returned to use case
//     ↓
// Use case returns Either<Failure, User> to BLoC
//     ↓
// BLoC emits LoginSuccess(user)