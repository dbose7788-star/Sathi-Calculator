import 'package:flutter/material.dart';
import 'skin8_shell.dart';

class SathiHome extends StatelessWidget {
  const SathiHome({
    super.key,
    required this.normalScreen,
  });

  final Widget normalScreen;

  @override
  Widget build(BuildContext context) {
    return Skin8Shell(
      selectedIndex: 0,
      child: normalScreen,
    );
  }


}
