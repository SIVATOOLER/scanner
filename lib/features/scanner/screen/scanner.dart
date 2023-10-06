import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inventory/config/app_color.dart';
import 'package:inventory/config/app_layout.dart';
import 'package:inventory/config/app_routes.dart';
import 'package:inventory/config/app_style.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool lightState = false;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundGreen,
      appBar: AppBar(
        title: const Text("Scanner"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: AppLayout.screenPadding,
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 9.5, 8, 10.0),
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: _buildQrView(context)),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.42,
                      // width: 200,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColor.scannerBoarderColor, width: 10),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () async {
                            await controller?.toggleFlash();
                            setState(() {
                              lightState
                                  ? lightState = false
                                  : lightState = true;
                            });
                          },
                          child: Icon(
                            lightState ? Icons.flash_on : Icons.flash_off,
                            size: 35,
                            color: AppColor.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //   Padding(
                //     padding: AppLayout.cardPadding,
                //     child: Row(
                //       children: [
                //         ElevatedButton(
                //             style: const ButtonStyle(
                //                 iconSize: MaterialStatePropertyAll(50),
                //                 shape: MaterialStatePropertyAll(CircleBorder())),
                //             onPressed: () async {
                //               await controller?.toggleFlash();
                //             },
                //             child: Icon(Icons.flashlight_on_rounded))
                //       ],
                //     ),
                //   )
              ],
            ),
          ),
          AppLayout.spaceH30,
          InkWell(
            onTap: () {
              //  controller?.dispose();
              // dispose();
              // Navigator.pop(context);
              // Navigator.pushNamed(context, AppRoutes.scanDetails);
              Navigator.popAndPushNamed(context, AppRoutes.scanDetails);
            },
            child: const Icon(
              Icons.qr_code_scanner_rounded,
              size: 100,
              color: AppColor.primary,
            ),
          ),
          AppLayout.spaceH30,
          if (result != null)
            Text(
              'Barcode Type: ${describeEnum(result!.format)} \n   Data: ${result!.code}',
              textAlign: TextAlign.center,
            )
          else
            Text(
              'Scan a code',
              style: AppStyle(context).headingLarge.copyWith(fontSize: 20),
            ),
          //   Expanded(
          //     flex: 3,
          //     child: FittedBox(
          //       fit: BoxFit.contain,
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         children: <Widget>[
          //           // if (result != null)
          //           //    Text(
          //           //       'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
          //           // else
          //             // const Text('Scan a code'),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             children: <Widget>[
          //               Container(
          //                 margin: const EdgeInsets.all(8),
          //                 child: ElevatedButton(
          //                     onPressed: () async {
          //                       await controller?.toggleFlash();
          //                       setState(() {});
          //                     },
          //                     child: FutureBuilder(
          //                       future: controller?.getFlashStatus(),
          //                       builder: (context, snapshot) {
          //                         return Text('Flash: ${snapshot.data}');
          //                       },
          //                     )),
          //               ),
          //               Container(
          //                 margin: const EdgeInsets.all(8),
          //                 child: ElevatedButton(
          //                     onPressed: () async {
          //                       await controller?.flipCamera();
          //                       setState(() {});
          //                     },
          //                     child: FutureBuilder(
          //                       future: controller?.getCameraInfo(),
          //                       builder: (context, snapshot) {
          //                         if (snapshot.data != null) {
          //                           return Text(
          //                               'Camera facing ${describeEnum(snapshot.data!)}');
          //                         } else {
          //                           return const Text('loading');
          //                         }
          //                       },
          //                     )),
          //               )
          //             ],
          //           ),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             children: <Widget>[
          //               Container(
          //                 margin: const EdgeInsets.all(8),
          //                 child: ElevatedButton(
          //                   onPressed: () async {
          //                     await controller?.pauseCamera();
          //                   },
          //                   child: const Text('pause',
          //                       style: TextStyle(fontSize: 20)),
          //                 ),
          //               ),
          //               Container(
          //                 margin: const EdgeInsets.all(8),
          //                 child: ElevatedButton(
          //                   onPressed: () async {
          //                     await controller?.resumeCamera();
          //                   },
          //                   child: const Text('resume',
          //                       style: TextStyle(fontSize: 20)),
          //                 ),
          //               )
          //             ],
          //           ),
          //         ],
          //       ),
          //     ),
          //   )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 100.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: AppColor.primary,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea - 30),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    // controller?.stopCamera();
    super.dispose();
  }
}
