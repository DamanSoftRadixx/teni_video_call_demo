import 'package:teni_video_call_demo/feature/login/domain/entities/user.dart'
    show RefreshTokenDetail;
import 'package:fpdart/fpdart.dart';
import '../../../../core/network/api_result.dart';

abstract class LoginRepository {
  Future<Either<Failure, RefreshTokenDetail>> generateTokenSandBox({
    required String roomName,
    required String participantName,
  });
}
