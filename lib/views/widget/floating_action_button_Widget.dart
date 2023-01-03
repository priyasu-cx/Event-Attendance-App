import 'package:flutter/material.dart';
import 'package:gdgkolkata/views/qr_scanner.dart';
import 'package:get/get.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: FloatingActionButton(
        elevation: 1,
        onPressed: () {
          Get.to(const QRViewExample());
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9)),
        child: Icon(
          Icons.qr_code_scanner_rounded,
          size: Get.height * 0.05,
        ),
      ),
    );
  }
}
