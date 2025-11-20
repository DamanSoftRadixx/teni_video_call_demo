import 'package:teni_video_call_demo/core/network/api_result.dart';
import 'package:teni_video_call_demo/feature/login/domain/entities/user.dart';
import 'package:teni_video_call_demo/feature/login/domain/repositories/login_repository.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/constants/common_constants.dart';
import '../datasources/login_remote_datasource.dart';
import '../models/login_request_model.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, RefreshTokenDetail>> generateTokenSandBox({
    required String roomName,
    required String participantName,
  }) async {
    try {
      final request = GenerateTokenSandBoxRequestModel(
        roomName: roomName,
        participantName: participantName,
        headers: CommonConstants.sandboxHeaders,
      );
      final userModel = await remoteDataSource.generateTokenSandBox(request);
      return Right(
        RefreshTokenDetail(
          tokenStatus: TokenStatus.generated,
          serverUrl: userModel.serverUrl ?? '',
          roomName: userModel.roomName ?? '',
          participantName: userModel.participantName ?? '',
          participantToken: userModel.participantToken ?? '',
        ),
      ); // since UserModel extends User
    } catch (e) {
      if (e is Failure) {
        return Left(e);
      }
      return Left(Failure(e.toString()));
    }
  }
}
