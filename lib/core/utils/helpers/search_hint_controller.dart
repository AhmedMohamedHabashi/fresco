import 'dart:async';
import 'package:flutter/foundation.dart';

class SearchHintController {
  final List<String> hints;
  final Duration duration;

  late final ValueNotifier<String> notifier;
  Timer? _timer;
  int _index = 0;

  SearchHintController({
    required this.hints,
    this.duration = const Duration(seconds: 3),
  }) {
    notifier = ValueNotifier(hints.first);

    _timer = Timer.periodic(duration, (_) {
      _index = (_index + 1) % hints.length;
      notifier.value = hints[_index];
    });
  }

  void dispose() {
    _timer?.cancel();
    notifier.dispose();
  }
}
