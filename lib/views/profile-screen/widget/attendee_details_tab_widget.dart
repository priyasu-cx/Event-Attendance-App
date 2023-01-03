import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/models/user_details.dart';
import '../../../utils/colors.dart';
import '../../widget/attendee_details_widget.dart';

class AttendeeDetailsTabWidget extends StatelessWidget {
  final UserModel attendee;

  const AttendeeDetailsTabWidget({
    Key? key,
    required this.attendee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: Get.height * 0.4,
      decoration: BoxDecoration(
        color: DevfestColor.googleGrey200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: AttendeeDetailsWidget(attendee: attendee),
    );
  }
}
