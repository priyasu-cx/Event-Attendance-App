import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gdgkolkata/utils/colors.dart';
import 'package:gdgkolkata/views/profile-screen/Profile_screen.dart';
import 'package:gdgkolkata/views/home_screen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:get/get.dart';

String? regID = "";

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  //String? regId = "";
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      if (kDebugMode) {
        print("hello");
      }
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: Get.height * 0.2,
                ),
                const Text(
                  "Scan QR Code",
                  style: TextStyle(
                      color: DevfestColor.googleGrey200,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Expanded(flex: 9, child: _buildQrView(context)),
                Expanded(
                  flex: 1,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        if (result != null)
                          Text(
                            // 'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}',
                            'Data: ${result!.code}',
                            style: const TextStyle(
                              color: DevfestColor.googleGrey200,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        else
                          const Text('Scan a code'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.all(8),
                              child: ElevatedButton(
                                onPressed: () async {
                                  await controller?.resumeCamera();
                                },
                                child: const Text('Refresh Camera',
                                    style: TextStyle(fontSize: 20)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    // var scanArea = (MediaQuery.of(context).size.width < 400 ||
    //         MediaQuery.of(context).size.height < 400)
    //     ? 300.0
    //     : 300.0;
    var scanArea = 250.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: DevfestColor.googleBlue500,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        controller.resumeCamera();
        result = scanData;
        regID = result!.code;
        controller.pauseCamera();
        //Get.to(Attendee());
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileScreen(regID: regID!),
            ));
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
