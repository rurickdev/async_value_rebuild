import 'package:flutter/material.dart';

class AnnounceWrapper extends StatelessWidget {
  const AnnounceWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    print('${'-' * 30}Announce Wrapper${'-' * 30}');
    return child;
  }
}
