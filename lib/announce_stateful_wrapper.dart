import 'package:flutter/material.dart';

enum AnnounceState {
  data,
  error,
  loading;
}

class AnnounceStatefulWrapper extends StatefulWidget {
  const AnnounceStatefulWrapper({
    super.key,
    required this.child,
    required this.state,
  });

  final Widget child;
  final AnnounceState state;

  @override
  State<AnnounceStatefulWrapper> createState() =>
      _AnnounceStatefulWrapperState();
}

class _AnnounceStatefulWrapperState extends State<AnnounceStatefulWrapper> {
  @override
  Widget build(BuildContext context) {
    print('${'·' * 30}Announce Stateful Wrapper${'·' * 30}');
    return widget.child;
  }
}
