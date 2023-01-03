import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future saveEmailID(String userEmailID) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('email_id', userEmailID);
  }

  Future<String?> getEmailID() async {
    final preferences = await SharedPreferences.getInstance();

    final userEmailID = preferences.getString('email_id');

    return userEmailID;
  }
}
