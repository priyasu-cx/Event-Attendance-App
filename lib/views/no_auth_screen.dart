import 'package:flutter/material.dart';
import 'package:gdgkolkata/utils/colors.dart';

class NoAuthScreen extends StatelessWidget {
  const NoAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: DevfestColor.bgcolor,
      body: Center(
        child: Text(
          "Uh Oh!\nSeems you’re lost.",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 38,
            color: DevfestColor.googleBlue500,
          ),
        ),
      ),
    );
  }
}
