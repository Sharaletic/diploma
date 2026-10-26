import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import '../../core/rest_client/common_rest_client.dart';
import '../../core/router/app_router.dart';
import '../feature/authentication/authentication.dart';
import '../model/app_config.dart';

abstract interface class IAppDependencies {
  Logger get logger;
  AppConfig get appConfig;
  AppRouter get appRouter;
  RestClientBase get restClient;
  IAuthenticationRepository get authenticationRepository;
  IRefreshTokenStorage get refreshTokenStorage;
  Future<void> dispose();
}

Future<IAppDependencies> init({
  required Logger logger,
  required AppConfig appConfig,
  required AppRouter appRouter,
}) async {
  final restClient = RestClientHTTP(
    baseUrl: "http://localhost:${appConfig.port}",
    client: createDefaultHttpClient(),
    interceptors: [],
  );

  final storage = FlutterSecureStorage();

  return AppDependencies._(
    logger: logger,
    appConfig: appConfig,
    appRouter: appRouter,
    restClient: restClient,
    storage: storage,
  );
}

final class AppDependencies implements IAppDependencies {
  AppDependencies._({
    required this._logger,
    required this._appConfig,
    required this._appRouter,
    required this._restClient,
    required this._storage,
  });

  final Logger _logger;
  final AppConfig _appConfig;
  final AppRouter _appRouter;
  final RestClientBase _restClient;
  final FlutterSecureStorage _storage;
  IAuthenticationRepository? _authenticationRepository;

  @override
  Logger get logger => _logger;

  @override
  AppConfig get appConfig => _appConfig;

  @override
  AppRouter get appRouter => _appRouter;

  @override
  RestClientBase get restClient => _restClient;

  @override
  IRefreshTokenStorage get refreshTokenStorage =>
      RefreshTokenStorage(storage: _storage);

  @override
  IAuthenticationRepository get authenticationRepository =>
      _authenticationRepository ??= AuthenticationRepository(
        restClient: _restClient,
        storage: _storage,
      );

  @override
  Future<void> dispose() async {
    await logger.close();
  }
}
