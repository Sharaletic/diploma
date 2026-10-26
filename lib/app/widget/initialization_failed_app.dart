import 'package:ui_kit/ui_kit.dart';

class InitializationFailedApp extends StatefulWidget {
  final Object error;
  final StackTrace stackTrace;
  final Future<void> Function()? onRetryInitialization;

  const InitializationFailedApp({
    required this.error,
    required this.stackTrace,
    this.onRetryInitialization,
    super.key,
  });

  @override
  State<InitializationFailedApp> createState() =>
      _InitializationFailedAppState();
}

class _InitializationFailedAppState extends State<InitializationFailedApp> {
  final _inProgress = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _inProgress.dispose();
    super.dispose();
  }

  Future<void> _retryInitialization() async {
    _inProgress.value = true;
    await widget.onRetryInitialization?.call();
    _inProgress.value = false;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final typography = theme.appTypography;

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Row(
                mainAxisAlignment: .center,
                children: [
                  UiText('Initialization failed', typography.h3),
                  if (widget.onRetryInitialization != null)
                    IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: _retryInitialization,
                    ),
                ],
              ),
              const SizedBox(height: 16),
              UiText('${widget.error}', typography.caption1),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: UiText('${widget.stackTrace}', typography.subtitle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
