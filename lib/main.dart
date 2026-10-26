import 'dart:async';
import 'package:diploma/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';
import 'app/bloc/app_bloc_observer.dart';
import 'app/feature/authentication/authentication.dart';
import 'app/logic/app_dependencies.dart';
import 'app/model/app_config.dart';
import 'app/widget/initialization_failed_app.dart';
import 'app/widget/root_context.dart';
import 'core/logger/logger.dart';
import 'core/router/app_router.dart';

void main() async {
  const appConfig = AppConfig();
  final logger = LoggerSettings.initLogger();
  final appRouter = AppRouter();

  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    Future<void> composeAndRun() async {
      try {
        final appDependencies = await init(
          logger: logger,
          appConfig: appConfig,
          appRouter: appRouter,
        );
        Bloc.observer = AppBlocObserver(logger: logger);
        runApp(MyApp(appDependencies: appDependencies));
      } on Object catch (error, stackTrace) {
        logger.error("initialization failed", error, stackTrace);
        runApp(
          InitializationFailedApp(
            error: error,
            stackTrace: stackTrace,
            onRetryInitialization: composeAndRun,
          ),
        );
      }
    }

    await composeAndRun();
  }, (error, stackTrace) => logger.severe(error, stackTrace));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appDependencies});
  final IAppDependencies appDependencies;

  @override
  Widget build(BuildContext context) {
    return RootContext(
      dependencies: appDependencies,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthSessionBloc>(
            lazy: false,
            create: (context) => AuthSessionBloc(
              repository: appDependencies.authenticationRepository,
            ),
          ),
        ],
        child: MaterialApp.router(
          title: 'Diploma',
          locale: const Locale('en'),
          localizationsDelegates: [
            AppLocalizations.delegate,
            ...GlobalMaterialLocalizations.delegates,
          ],
          supportedLocales: [Locale('en'), Locale('ru')],
          debugShowCheckedModeBanner: false,
          theme: createThemeData(
            palette: defaultColorPalette,
            typography: defaultTypography,
          ),
          builder: (context, child) {
            final gradient = Theme.of(context).appGradient;
            return Container(
              decoration: BoxDecoration(gradient: gradient.backgroundGradient),
              child: child,
            );
          },
          routerConfig: appDependencies.appRouter.config(),
        ),
      ),
    );
  }
}
