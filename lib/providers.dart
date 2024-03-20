import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
FutureOr<int> asyncCounter(AsyncCounterRef ref) async {
  await Future.delayed(const Duration(seconds: 2));
  return 1;
}
