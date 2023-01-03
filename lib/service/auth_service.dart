import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:gdgkolkata/main.dart';
import 'package:gdgkolkata/service/core/user_preferences.dart';
import 'package:gdgkolkata/service/database_service.dart';
import 'package:gdgkolkata/views/home_screen.dart';
import 'package:gdgkolkata/views/login_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../logic/manager/verify_result_manager.dart';

class StateManager extends ConsumerWidget {
  const StateManager({super.key});

  AuthService get _authService => GetIt.I<AuthService>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(verifyResultManager);
    _authService.updateState(ref);
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            // bool result = await checkState();
            if (state) {
              return const HomeScreen();
            } else {
              return const LoginScreen();
            }
          } else {
            return const LoginScreen();
          }
        });
  }
}

///this class is responsible to handle all the authentication service
///
///
class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  DataBaseService get _databaseService => GetIt.I<DataBaseService>();
  UserPreferences get _preferences => GetIt.I<UserPreferences>();

  ///firebase user
  ///
  ///
  User? user;

  updateState(WidgetRef ref) async {
    await AuthService().checkState(ref);
  }

  Future<bool> checkState(WidgetRef ref) async {
    String? emailID = await _preferences.getEmailID();
    if (emailID == null) {
      return false;
    }
    bool result = await _databaseService.verifyVolunteer(emailID);
    if (result) {
      ref.read(verifyResultManager.state).state = true;
    }
    return result;
  }

  ///signin
  Future<bool> signInWithGoogle() async {

    print('Hitted here');

    try {
      // Trigger the authentication flow
      GoogleSignInAccount? googleUser =
          await GoogleSignIn(scopes: <String>["email"]).signIn();

      print(googleUser!.email);

      // Obtain the auth details from the request
      GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      print(credential.signInMethod);

      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      user = userCredential.user;

      print(user!.email!);
      //uid = user!.uid;
      if (user != null) {
        ///todo get the user email ID
        ///todo check if the email ID is available in the database
        ///
        ///
        String emailID = user!.email!;
        bool result = await _databaseService.verifyVolunteer(emailID);
        if (result) {
          //ref.read(verify_result.state).state = true;
          await _preferences.saveEmailID(emailID);
        }
        return result;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  ///signOut
  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
