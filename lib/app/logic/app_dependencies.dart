import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import '../../core/rest_client/common_rest_client.dart';
import '../../core/router/app_router.dart';
import '../../data/data.dart';
import '../feature/authentication/authentication.dart';
import '../model/app_config.dart';

abstract interface class IAppDependencies {
  Logger get logger;
  AppConfig get appConfig;
  AppRouter get appRouter;
  RestClientBase get restClient;
  IRefreshTokenStorage get refreshTokenStorage;
  AppDatabase get appDatabase;
  IAuthenticationRepository get authenticationRepository;
  Future<void> dispose();
}

Future<IAppDependencies> init({
  required Logger logger,
  required AppConfig appConfig,
  required AppRouter appRouter,
}) async {
  final storage = FlutterSecureStorage();
  final appStorage = RefreshTokenStorage(storage: storage);

  late final AppDependencies dependencies;

  final restClient = RestClientHTTP(
    baseUrl: "http://localhost:${appConfig.port}",
    client: createDefaultHttpClient(),
    interceptors: [
      AuthInterceptor(
        () => dependencies._loadAccessToken(),
        shouldLoadToken: (request) {
          final path = request.uri.path;
          return !path.startsWith('/auth/mobile/challenges') &&
              path != '/auth/mobile/refresh';
        },
      ),
      BackendExceptionInterceptor(),
    ],
  );

  final appDatabase = AppDatabase();

  dependencies = AppDependencies._(
    logger: logger,
    appConfig: appConfig,
    appRouter: appRouter,
    restClient: restClient,
    appStorage: appStorage,
    appDatabase: appDatabase,
  );

  return dependencies;
}

final class AppDependencies implements IAppDependencies {
  AppDependencies._({
    required this._logger,
    required this._appConfig,
    required this._appRouter,
    required this._restClient,
    required this._appStorage,
    required this._appDatabase,
  });

  final Logger _logger;
  final AppConfig _appConfig;
  final AppRouter _appRouter;
  final RestClientBase _restClient;
  final IRefreshTokenStorage _appStorage;
  final AppDatabase _appDatabase;
  IAuthenticationRepository? _authenticationRepository;
  Future<String>? _accessTokenLoad;

  Future<String> _loadAccessToken() {
    final accessToken = _appStorage.accessToken;
    if (accessToken != null && accessToken.isNotEmpty) {
      return Future.value(accessToken);
    }

    return _accessTokenLoad ??= _refreshAccessToken();
  }

  Future<String> _refreshAccessToken() async {
    try {
      final session = await authenticationRepository.refresh();
      return session?.accessToken ?? '';
    } finally {
      _accessTokenLoad = null;
    }
  }

  @override
  Logger get logger => _logger;

  @override
  AppConfig get appConfig => _appConfig;

  @override
  AppRouter get appRouter => _appRouter;

  @override
  RestClientBase get restClient => _restClient;

  @override
  IRefreshTokenStorage get refreshTokenStorage => _appStorage;

  @override
  AppDatabase get appDatabase => _appDatabase;

  @override
  IAuthenticationRepository get authenticationRepository =>
      _authenticationRepository ??= AuthenticationRepository(
        restClient: _restClient,
        storage: _appStorage,
      );

  @override
  Future<void> dispose() async {
    try {
      await _appDatabase.close();
    } finally {
      await _logger.close();
    }
  }
}
