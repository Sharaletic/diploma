import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

class CountdownCubit extends Cubit<Duration> {
  CountdownCubit() : super(Duration.zero);

  Timer? _timer;

  void start(Duration duration) {
    _timer?.cancel();
    final deadline = DateTime.now().add(duration);
    emit(duration);
    _timer = Timer.periodic(Duration(seconds: 1), (t) {
      final left = deadline.difference(.now());
      if (left <= .zero) {
        emit(.zero);
        t.cancel();
      } else {
        emit(left);
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
