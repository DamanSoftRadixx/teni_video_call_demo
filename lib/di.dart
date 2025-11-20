import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:teni_video_call_demo/feature/login/data/datasources/login_remote_datasource.dart'
    show LoginRemoteDataSource;
import 'package:teni_video_call_demo/feature/login/data/datasources/login_remote_datasource_impl.dart'
    show LoginRemoteDataSourceImpl;
import 'package:teni_video_call_demo/feature/login/data/repositories/login_repository_impl.dart'
    show LoginRepositoryImpl;
import 'package:teni_video_call_demo/feature/login/domain/repositories/login_repository.dart'
    show LoginRepository;
import 'package:teni_video_call_demo/feature/login/domain/usecases/login_user.dart'
    show LoginUser;
import 'package:teni_video_call_demo/feature/login/presentation/bloc/login_bloc.dart'
    show LoginBloc;
import 'package:teni_video_call_demo/feature/video_calling/presentation/bloc/video_calling_bloc.dart';
import 'core/network/api_helper.dart' show ApiHelper;
import 'core/network/connection_checker.dart';
import 'core/network/dio_client.dart' show DioClient;
import 'package:path_provider/path_provider.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  _registerLocalStorage();
  _registerLocalization();
  _registerNetworking();
  _initAuth();
  _initProducts();
}

// Localization
void _registerLocalization() {
  getIt.registerSingleton<FlutterLocalization>(FlutterLocalization.instance);
}

// Dio and related services
void _registerNetworking() {
  getIt.registerFactory<InternetConnection>(() => InternetConnection());
  getIt.registerFactory<ConnectionChecker>(
    () => ConnectionCheckerImpl(getIt<InternetConnection>()),
  );
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<DioClient>(() => DioClient(getIt<Dio>()));
  getIt.registerLazySingleton<ApiHelper>(
    () => ApiHelper(getIt<DioClient>(), getIt<ConnectionChecker>()),
  );
}

// Secure Storage
void _registerLocalStorage() {
  getIt.registerLazySingleton<FlutterSecureStorage>(() {
    if (!kIsWeb && Platform.isAndroid) {
      return FlutterSecureStorage(aOptions: _getAndroidOptions());
    } else if (!kIsWeb && Platform.isIOS) {
      return FlutterSecureStorage(iOptions: _getIOSOptions());
    } else {
      return const FlutterSecureStorage();
    }
  });
}

// Android storage options
AndroidOptions _getAndroidOptions() =>
    const AndroidOptions(encryptedSharedPreferences: true);

// iOS storage options
IOSOptions _getIOSOptions() =>
    const IOSOptions(accessibility: KeychainAccessibility.first_unlock);

void _initAuth() {
  // Datasource
  getIt.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSourceImpl(getIt<ApiHelper>()),
  );

  // repository
  getIt.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(getIt<LoginRemoteDataSource>()),
  );

  // use cases
  getIt.registerFactory<LoginUser>(() => LoginUser(getIt<LoginRepository>()));

  // Bloc
  getIt.registerLazySingleton(
    () => LoginBloc(loginUseCase: getIt<LoginUser>()),
  );

  getIt.registerLazySingleton(() => VideoCallingBloc());
}

void _initProducts() {
  // datasource
  // getIt.registerLazySingleton<ProductsRemoteDataSource>(
  //   () => ProductsRemoteDataSourceImp(getIt<ApiHelper>()),
  // );

  // getIt.registerLazySingleton<ProductCacheDataSource>(
  //   () => ProductCacheDataSourceImpl(),
  // );
  // getIt.registerLazySingleton<ProductLocalDataSource>(
  //   () => ProductLocalDataSourceImpl(getIt<Isar>()),
  // );
  // // repository
  // getIt.registerLazySingleton<ProductsRepository>(
  //   () => ProductsRepositoryImpl(
  //     getIt<ProductsRemoteDataSource>(),
  //     getIt<ProductLocalDataSource>(),
  //     getIt<ProductCacheDataSource>(),
  //   ),
  // );

  // // use cases
  // getIt.registerFactory<ProductsUseCase>(
  //   () => ProductsUseCase(getIt<ProductsRepository>()),
  // );

  // // Bloc
  // getIt.registerFactory(
  //   () => ProductsListBloc(
  //     productsUseCase: getIt<ProductsUseCase>(),
  //     connectionChecker: getIt<ConnectionChecker>(),
  //   ),
  // );
  // getIt.registerFactory(
  //   () => ProductDetailBloc(productsUseCase: getIt<ProductsUseCase>()),
  // );
}
