import 'package:flutter/material.dart';
import 'package:gdgkolkata/logic/models/user_details.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';

class AttendeeDetailsWidget extends StatelessWidget {
  final UserModel attendee;

  const AttendeeDetailsWidget({
    Key? key,
    required this.attendee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ///Name
        _attendeeDetailsItemWidget(
          "Name: ${attendee.name}",
        ),
        _verticalSpacer(),

        ///email
        _attendeeDetailsItemWidget(
          "Email: ${attendee.email}",
        ),
        _verticalSpacer(),

        ///Designation
        _attendeeDetailsItemWidget(
          "Designation: ${attendee.designation}",
        ),
        _verticalSpacer(),

        ///Gender
        _attendeeDetailsItemWidget(
          "Gender: ${attendee.gender}",
        ),
        _verticalSpacer(),

        ///organization
        _attendeeDetailsItemWidget(
          "Org: ${attendee.organisation}",
        ),
        _verticalSpacer(),
        _attendeeDetailsItemWidget(
          "Food: ${attendee.food}",
        ),
        _verticalSpacer(),
        _attendeeDetailsItemWidget(
          "T-shirt: ${attendee.tshirt_size}",
        ),
      ],
    );
  }

  Widget _attendeeDetailsItemWidget(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: DevfestColor.bgcolor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _verticalSpacer() {
    return SizedBox(
      height: Get.height * 0.01,
    );
  }
}
