import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import '../../core/logger/logger.dart';

class AppBlocObserver extends BlocObserver {
  AppBlocObserver({required this.logger});
  final Logger logger;

  @override
  void onCreate(BlocBase<Object?> bloc) {
    super.onCreate(bloc);
    logger.info('Created a new Bloc: ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (event == null) return;
    logger.info('Event $event in ${bloc.runtimeType}');
    final Object? state = bloc.state;
    if (state == null) return;
  }

  @override
  void onChange(BlocBase<Object?> bloc, Change<Object?> change) {
    super.onChange(bloc, change);
    logger.info(
      'Changing the state ${bloc.runtimeType}: ${change.currentState} → ${change.nextState}',
    );
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    final Object? event = transition.event;
    final Object? currentState = transition.currentState;
    final Object? nextState = transition.nextState;
    if (event == null || currentState == null || nextState == null) return;
    logger.info(
      'Transition ${bloc.runtimeType}: $event from $currentState to $nextState',
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    logger.error('Error in ${bloc.runtimeType}', error, stackTrace);
  }

  @override
  void onClose(BlocBase<Object?> bloc) {
    super.onClose(bloc);
    logger.info('${bloc.runtimeType} is close');
  }
}
