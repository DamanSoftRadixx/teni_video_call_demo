import 'package:teni_video_call_demo/feature/login/domain/entities/user.dart'
    show RefreshTokenDetail;
import 'package:fpdart/fpdart.dart';
import '../../../../core/network/api_result.dart';
import '../repositories/login_repository.dart';

class LoginUser {
  final LoginRepository repository;

  LoginUser(this.repository);

  Future<Either<Failure, RefreshTokenDetail>> gernateTokenCall({
    required String roomName,
    required String participantName,
  }) {
    return repository.generateTokenSandBox(
      roomName: roomName,
      participantName: participantName,
    );
  }
}
