import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gdgkolkata/service/auth_service.dart';
import 'package:gdgkolkata/utils/asset.dart';
import 'package:gdgkolkata/utils/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 4, milliseconds: 500), (() {
      Future.delayed(const Duration(seconds: 2)).then((value) {
        Get.offAll(const StateManager(),
            transition: Transition.fadeIn,
            duration: const Duration(seconds: 2));
      });
    }));
    super.initState();
  }

  ///todo: check in this screen
  ///todo: if an email ID is available or not
  ///todo: if it is available then check with the DataBase service
  ///todo: if it is a valid volunteer email ID or not
  ///todo: if all true then home screen
  ///todo: else no auth screen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DevfestColor.bgcolor,
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.23),
          child: Image.asset(
            DevFestImageAsset.devFestHashTagImage,
          ),
        ),
      ),
    );
  }
}
