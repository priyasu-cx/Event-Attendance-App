import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gdgkolkata/attendee_email.dart';
// import 'package:gdgkolkata/attendee_email.dart';
import 'package:gdgkolkata/service/auth_service.dart';
import 'package:gdgkolkata/service/database_service.dart';
import 'package:gdgkolkata/utils/asset.dart';
import 'package:gdgkolkata/utils/colors.dart';
import 'package:gdgkolkata/views/home_screen.dart';
import 'package:gdgkolkata/views/login_screen.dart';
import 'package:gdgkolkata/views/widget/floating_action_button_Widget.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

// import '../../attendee_email.dart';
import '../../logic/models/user_details.dart';
import 'widget/attendee_details_tab_widget.dart';
import 'widget/attendee_perks_tab_widget.dart';

class ProfileScreen extends StatefulWidget {
  final String regID;

  const ProfileScreen({Key? key, required this.regID}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  DataBaseService get _databaseService => GetIt.I<DataBaseService>();

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  ///remove this
  // var emails = ["priyasuguin4@gmail.com", "shubhayumajumdar64@gmail.com"];

  @override
  Widget build(BuildContext context) {
    ///Changer variables
    ///

    return Scaffold(
      backgroundColor: DevfestColor.bgcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
              title: const Text(
                'HOME',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: DevfestColor.bgcolor,
                ),
              ),
              onTap: () {
                Get.offAll(const HomeScreen());
              },
            ),
            ListTile(
              title: const Text(
                'SIGN OUT',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: DevfestColor.bgcolor),
              ),
              onTap: () async {
                await AuthService().signOut();
                Get.offAll(const LoginScreen());
              },
            ),
          ],
        ),
      ),
      body: StreamBuilder<UserModel?>(
          stream: _databaseService.streamAttendee(widget.regID),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == null) {
                return const Center(
                  child: Text(
                    "INVALID QR CODE",
                    style: TextStyle(
                        color: DevfestColor.googleGrey200,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                );
              } else {

                return !emails.contains(snapshot.data!.email!)
                    ? const Center(
                  child: Text(
                    "INVALID ENTRY",
                    style: TextStyle(
                        color: DevfestColor.googleGrey200,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                )
                    : Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 30),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (snapshot.data!.name != null)
                                ? "Name: ${snapshot.data!.name}"
                                : "INVALID QR CODE",
                            style: const TextStyle(
                                color: DevfestColor.googleGrey200,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),

                      SizedBox(height: Get.height * 0.02),
                      Container(
                        height: 48,
                        decoration: BoxDecoration(
                            color: DevfestColor.devFestPurple,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                            padding: const EdgeInsets.all(7),
                            child: TabBar(
                              controller: _tabController,
                              indicator: BoxDecoration(
                                  color: DevfestColor.googleGrey200,
                                  borderRadius:
                                  BorderRadius.circular(10)),
                              unselectedLabelColor:
                              DevfestColor.googleGrey200,
                              labelColor: DevfestColor.devFestPurple,
                              tabs: const [
                                Tab(
                                  text: 'STATUS',
                                ),
                                Tab(
                                  text: 'ABOUT',
                                ),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: Get.height * 0.04,
                      ),

                      ///TabBarView
                      ///
                      ///

                      SizedBox(
                        height: Get.height * 0.4,
                        child: snapshot.data == null
                            ? const Center(
                          child: CircularProgressIndicator(),
                        )
                            : DefaultTabController(
                          length: 2,
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              AttendeePerksTabWidget(
                                attendee: snapshot.data!,
                                registrationID: widget.regID,
                              ),
                              AttendeeDetailsTabWidget(
                                attendee: snapshot.data!,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            } else {
              if (snapshot.hasError) {
                return const Center(
                  child: Text(
                    "INVALID QR CODE",
                    style: TextStyle(
                        color: DevfestColor.googleGrey200,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const FloatingActionButtonWidget(),
    );
  }
}
