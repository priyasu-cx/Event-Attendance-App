import 'package:flutter/material.dart';
import 'package:gdgkolkata/service/auth_service.dart';
import 'package:gdgkolkata/utils/asset.dart';
import 'package:gdgkolkata/utils/colors.dart';
import 'package:gdgkolkata/views/home_screen.dart';
import 'package:gdgkolkata/views/no_auth_screen.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  AuthService get _authService => GetIt.I<AuthService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DevfestColor.bgcolor,
      body: loginUI(),
    );
  }

  Widget loginUI() {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal:20),
          child:
          Image.asset(
            DevFestImageAsset.devFestHashTagImage,
          ),),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: Get.height * 0.55,
              ),
              Material(
                shape: const CircleBorder(side: BorderSide.none),
                color: DevfestColor.googleGrey200,
                child: InkWell(
                  borderRadius: BorderRadius.circular(Get.width * 0.08),
                  onTap: () async {
                    final state = await _authService.signInWithGoogle();

                    if (state == true) {
                      Get.offAll(const HomeScreen());
                    } else {
                      Get.offAll(const NoAuthScreen());
                    }
                  },

                  splashColor: DevfestColor.googleBlue500.withAlpha(80),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      DevFestImageAsset.googleIcon,
                      width: Get.width * 0.16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
