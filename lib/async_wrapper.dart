import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncWrapper<T> extends StatefulWidget {
  const AsyncWrapper({
    super.key,
    required this.asyncValue,
    required this.data,
    required this.error,
    required this.loading,
  });

  final AsyncValue<T> asyncValue;
  final Widget Function(T data) data;
  final Widget Function(Object error, StackTrace stackTrace) error;
  final Widget Function() loading;

  @override
  State<AsyncWrapper<T>> createState() => _AsyncWrapperState<T>();
}

class _AsyncWrapperState<T> extends State<AsyncWrapper<T>> {
  @override
  Widget build(BuildContext context) {
    print('${'*' * 30}Async Wrapper${'*' * 30}');

    return widget.asyncValue.when(
      data: widget.data,
      error: widget.error,
      loading: widget.loading,
    );
  }
}
