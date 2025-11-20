import 'package:teni_video_call_demo/feature/login/domain/entities/user.dart'
    show RefreshTokenDetail, TokenStatus;
import 'package:teni_video_call_demo/feature/login/presentation/bloc/login_event.dart';
import 'package:teni_video_call_demo/feature/login/presentation/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/login_user.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUser _loginUseCase;
  LoginBloc({required LoginUser loginUseCase})
    : _loginUseCase = loginUseCase,
      super(LoginInitial()) {
    on<GenerateTokenLoginEvent>((event, emit) async {
      await _onGenerateTokenLogin(event, emit);
    });
    on<JoinVideoCallLoginEvent>((event, emit) async {
      await _onJoinVideoCallLogin(event, emit);
    });
    on<ResetTokenEvent>((event, emit) async {
      await _onResetToken(event, emit);
    });
    on<PreConfigureValuesEvent>((event, emit) async {
      await _onPreConfigureValues(event, emit);
    });
  }

  Future<void> _onPreConfigureValues(
    PreConfigureValuesEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(
      LoginSuccess(
        event.refreshTokenDetail.copyWith(tokenStatus: TokenStatus.generated),
      ),
    );
  }

  Future<void> _onResetToken(
    ResetTokenEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(
      LoginSuccess(
        RefreshTokenDetail(
          tokenStatus: TokenStatus.notGenerated,
          serverUrl: event.hostUrl,
          roomName: event.roomName,
          participantName: event.participantName,
          participantToken: '',
        ),
      ),
    );
  }

  Future<void> _onGenerateTokenLogin(
    GenerateTokenLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    if (!emit.isDone) {
      emit(LoginLoading());
    }
    await Future.delayed(const Duration(seconds: 1));
    try {
      final result = await _loginUseCase.gernateTokenCall(
        roomName: event.roomName,
        participantName: event.participantName,
      );

      // Check if the bloc is still active before emitting
      if (!emit.isDone) {
        result.match(
          (failure) => emit(LoginFailure(failure.message)),
          (user) => emit(LoginSuccess(user)),
        );
      }
    } catch (e) {
      // Check if the bloc is still active before emitting error
      if (!emit.isDone) {
        emit(LoginFailure(e.toString()));
      }
    }
  }

  Future<void> _onJoinVideoCallLogin(
    JoinVideoCallLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    // if (!emit.isDone) {
    //   emit(LoginLoading());
    // }
    // emit(
    //   LoginSuccess(
    //     RefreshTokenDetail(
    //       tokenStatus: TokenStatus.notGenerated,
    //       serverUrl: event.hostUrl,
    //       roomName: event.roomName,
    //       participantName: event.participantName,
    //       participantToken: '',
    //     ),
    //   ),
    // );
  }
}
