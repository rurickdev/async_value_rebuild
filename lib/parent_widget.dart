import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc_typical_when/announce_stateful_wrapper.dart';
import 'package:poc_typical_when/announce_wrapper.dart';
import 'package:poc_typical_when/async_wrapper.dart';
import 'package:poc_typical_when/providers.dart';

class ParentWidget extends ConsumerStatefulWidget {
  const ParentWidget({super.key, required this.title});

  final String title;

  @override
  ConsumerState<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends ConsumerState<ParentWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final asyncCounter = ref.watch(asyncCounterProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            AsyncWrapper(
              asyncValue: asyncCounter,
              error: (e, s) => const SizedBox.shrink(),
              loading: () => const SizedBox.shrink(),
              data: (data) => const SizedBox.shrink(),
            ),
            asyncCounter.when(
              error: (e, s) => const AnnounceWrapper(child: SizedBox.shrink()),
              loading: () => const AnnounceWrapper(child: SizedBox.shrink()),
              data: (data) => const AnnounceWrapper(child: SizedBox.shrink()),
            ),
            asyncCounter.when(
              error: (e, s) => AnnounceWrapper(child: Container()),
              loading: () => AnnounceWrapper(child: Container()),
              data: (data) => AnnounceWrapper(child: Container()),
            ),
            asyncCounter.when(
              error: (e, s) => const AnnounceStatefulWrapper(
                state: AnnounceState.error,
                child: SizedBox.shrink(),
              ),
              loading: () => const AnnounceStatefulWrapper(
                state: AnnounceState.loading,
                child: SizedBox.shrink(),
              ),
              data: (data) => const AnnounceStatefulWrapper(
                state: AnnounceState.data,
                child: SizedBox.shrink(),
              ),
            ),
            asyncCounter.when(
              error: (e, s) => AnnounceStatefulWrapper(
                state: AnnounceState.error,
                child: Container(),
              ),
              loading: () => AnnounceStatefulWrapper(
                state: AnnounceState.loading,
                child: Container(),
              ),
              data: (data) => AnnounceStatefulWrapper(
                state: AnnounceState.data,
                child: Container(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
