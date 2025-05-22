import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/src/app.dart';

void main() {
  runApp(ProviderScope(
    child: const MyApp(),
    observers: [LogObserver()],
  ));
}

class LogObserver extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    
    super.didUpdateProvider(provider, previousValue, newValue, container);

    debugPrint('${provider.name ?? provider.runtimeType} $newValue');
  }
}
