import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../../../logic/models/user_details.dart';
import '../../../service/database_service.dart';
import '../../../utils/colors.dart';

class AttendeePerksTabWidget extends StatefulWidget {
  final UserModel attendee;
  final String registrationID;

  const AttendeePerksTabWidget({
    Key? key,
    required this.attendee,
    required this.registrationID,
  }) : super(key: key);

  @override
  State<AttendeePerksTabWidget> createState() => _AttendeePerksTabWidgetState();
}

class _AttendeePerksTabWidgetState extends State<AttendeePerksTabWidget> {
  DataBaseService get _databaseService => GetIt.I<DataBaseService>();

  Color checkEntry() {
    return Colors.red;
  }

  Color inactiveColor = DevfestColor.inactiveColor;
  Color inactiveIconColor = DevfestColor.inactiveIconColor;

  Color entryContainerColor =  DevfestColor.googleYellow500;
  Color entryIconColor =  DevfestColor.googleBlue500;
  Color entryTextColor =  DevfestColor.bgcolor;

  Color foodContainerColor =  DevfestColor.googleRed500;
  Color foodIconColor = DevfestColor.googleYellow500;
  Color foodTextColor =  DevfestColor.googleGrey200;

  Color swagContainerColor =  DevfestColor.googleBlue500;
  Color swagIconColor = DevfestColor.googleGrey200;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Container(
                    width: Get.width * 0.4,
                    height: Get.height * 0.17,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: !widget.attendee.isAttending!
                              ? entryContainerColor
                              : inactiveColor,
                          width: 2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_add,
                          color: !widget.attendee.isAttending!
                              ? entryIconColor
                              : inactiveColor,
                          size: 40,
                        ),
                        Text(
                          "  Entry",
                          style: TextStyle(
                              color: !widget.attendee.isAttending!
                                  ? entryIconColor
                                  : inactiveColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                onDoubleTap: () async {
                  if (!widget.attendee.isAttending!) {
                    await _databaseService.updateEntry(widget.registrationID);
                  }
                },
              ),
              InkWell(
                child: Container(
                    width: Get.width * 0.4,
                    height: Get.height * 0.17,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: !widget.attendee.hasFood!
                              ? foodContainerColor
                              : inactiveColor,
                          width: 2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.fastfood,
                          color: !widget.attendee.hasFood!
                              ? foodIconColor
                              : inactiveIconColor,
                          size: 40,
                        ),
                        Text(
                          "Food",
                          style: TextStyle(
                              color: !widget.attendee.hasFood!
                                  ? foodIconColor
                                  : inactiveIconColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                onDoubleTap: () async {
                  if (!widget.attendee.hasFood!) {
                    await _databaseService.updateFood(widget.registrationID);
                  }
                },
              )
            ],
          ),
          SizedBox(height: Get.height * 0.02),
          InkWell(
            child: Container(
                height: Get.height * 0.17,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: widget.attendee.hasSwag!
                        ? inactiveColor
                        : swagContainerColor,
                    width: 4,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.card_giftcard,
                      color: swagIconColor,
                      size: 50,
                    ),
                    Text(
                      "Swag",
                      style: TextStyle(
                          color: widget.attendee.hasSwag!
                              ? inactiveIconColor
                              : swagIconColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )),
            onDoubleTap: () async {
              if (!widget.attendee.hasSwag!) {
                await _databaseService.updateSwag(widget.registrationID);
              }
            },
          )
        ],
      ),
    );
  }
}
