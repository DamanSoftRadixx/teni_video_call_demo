import 'package:teni_video_call_demo/core/constants/app_strings.dart'
    show ErrorStrings;
import 'package:teni_video_call_demo/core/network/requirest_type.dart';
import '../../../../core/network/api_config.dart';
import '../../../../core/network/api_helper.dart';
import '../../../../core/network/api_result.dart';
import 'login_remote_datasource.dart';
import '../models/login_response_model.dart';
import '../models/login_request_model.dart';

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final ApiHelper apiHelper;
  LoginRemoteDataSourceImpl(this.apiHelper);

  @override
  Future<GenerateTokenSandBox> generateTokenSandBox(
    GenerateTokenSandBoxRequestModel request,
  ) async {
    final response = await apiHelper.request(
      endPoint: ApiConfig.gernateTokenSandBox,
      method: RequestType.post,
      body: request.toJson(),
      headers: request.headers,
      decoder: (data) => GenerateTokenSandBox.fromJson(data),
    );
    if (response is Success<GenerateTokenSandBox>) {
      return response.data;
    } else if (response is Failure) {
      throw response;
    }
    throw Exception(ErrorStrings.unknownError);
  }
}
