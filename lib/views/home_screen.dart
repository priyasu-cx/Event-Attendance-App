import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gdgkolkata/service/auth_service.dart';
import 'package:gdgkolkata/service/database_service.dart';
import 'package:gdgkolkata/utils/colors.dart';
import 'package:gdgkolkata/utils/asset.dart';
import 'package:gdgkolkata/views/login_screen.dart';
import 'package:gdgkolkata/views/profile-screen/Profile_screen.dart';
import 'package:gdgkolkata/views/qr_scanner.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    const StateManager();
    super.initState();
  }

  AuthService get _authService => GetIt.I<AuthService>();

  DataBaseService get _databaseService => GetIt.I<DataBaseService>();

  @override
  Widget build(BuildContext context) {
    return homeScreenWidget();
  }

  WillPopScope homeScreenWidget() {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: DevfestColor.bgcolor,
        //extendBodyBehindAppBar: true,
        appBar: AppBar(
          //primary: false,
          backgroundColor: Colors.transparent,
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   onPressed: () {},
          // ),
          actions: [
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image.network(
                    FirebaseAuth.instance.currentUser!.photoURL!,
                  ),
                ))
          ],
        ),
        drawer: Drawer(
          backgroundColor: DevfestColor.googleGrey200,
          width: Get.width * 0.7,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                padding: const EdgeInsets.all(0.0),
                decoration: const BoxDecoration(
                  color: DevfestColor.bgcolor,
                ),
                child: Image.asset(DevFestImageAsset.menuHeader),
              ),
              ListTile(
                title: const Text('HOME',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: DevfestColor.bgcolor)),
                onTap: () {
                  Get.offAll(const HomeScreen());
                },
              ),
              ListTile(
                title: const Text('SIGN OUT',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: DevfestColor.bgcolor)),
                onTap: () async {
                  await _authService.signOut();
                  Get.offAll(const LoginScreen());
                },
              ),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              DevFestImageAsset.devFestGDGKolLogo,
              height: Get.height * 0.25,
            ),
            const SizedBox(height: 5),
            const Text(
              "Volunteer Name: ",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: DevfestColor.googleGrey200),
            ),
            Text(
              FirebaseAuth.instance.currentUser!.displayName!,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: DevfestColor.googleGrey200),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                border: Border.all(
                  color: Colors.white,
                  width: 1.2,
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  StreamBuilder<int?>(
                      stream: _databaseService.streamEntry(),
                      builder: (context, snapshot) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Total Entry: ",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: DevfestColor.googleBlue500),
                            ),
                            Text(
                              snapshot.hasData || snapshot.data != null
                                  ? snapshot.data!.toString()
                                  : "0",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: DevfestColor.googleGrey200),
                            ),
                          ],
                        );
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  StreamBuilder<int?>(
                    stream: _databaseService.streamLunch(),
                    builder: (context, snapshot) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Lunch count: ",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber),
                          ),
                          Text(
                            snapshot.hasData || snapshot.data != null
                                ? snapshot.data!.toString()
                                : "0",
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: DevfestColor.googleGrey200),
                          ),
                        ],
                      );
                    }
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  StreamBuilder<int?>(
                    stream: _databaseService.streamSwag(),
                    builder: (context, snapshot) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "SWAG Collected: ",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: DevfestColor.googleGreen500,
                            ),
                          ),
                          Text(
                            snapshot.hasData || snapshot.data != null
                                ? snapshot.data!.toString()
                                : "0",
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: DevfestColor.googleGrey200),
                          ),
                        ],
                      );
                    }
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: FloatingActionButton(
            elevation: 1,
            onPressed: () {
              Get.to(const QRViewExample());
              /*Get.to(const ProfileScreen(
                  regID: '528b8361-f90a-45db-bff6-da2d791bf46b'));*/
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
            child: Icon(
              Icons.qr_code_scanner_rounded,
              size: Get.height * 0.05,
            ),
          ),
        ),
      ),
    );
  }
}
