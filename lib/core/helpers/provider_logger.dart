import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class ProviderLogger extends ProviderObserver {
  final Logger _logger;

  ProviderLogger(Logger logger) : _logger = logger;

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    _logger.i('''
Provider: "${provider.name ?? provider.runtimeType}"
PreviousValue: "${previousValue.toString()}"
NewValue: "${newValue.toString()}"''');
  }
}
