import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:travel_app/representations/screens/qr_code/my_qr_screen.dart';
import 'package:travel_app/representations/widgets/app_bar_container.dart';

import '../../../core/helpers/page_route_helper.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({super.key});

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  final MobileScannerController _controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
    returnImage: true,
  );
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      paddingContent: const EdgeInsets.only(top: 0),
      titleString: "QR Code",
      child: Stack(
        children: [
          Center(
            child: MobileScanner(
              controller: _controller,
              onDetect: (capture) {
                print(capture);
                final List<Barcode> barcodes = capture.barcodes;
                final Uint8List? image = capture.image;

                for (final barcode in barcodes) {
                  print('==========${barcode.rawValue}');
                }
                if (image != null) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(barcodes.first.rawValue ?? ''),
                        content: Image(
                          image: MemoryImage(image),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.symmetric(
                  horizontal: BorderSide(
                      color: Colors.black.withOpacity(0.4), width: 180),
                  vertical: BorderSide(
                      color: Colors.black.withOpacity(0.4), width: 50)),
            ),
          ),
          Positioned(
            bottom: 120,
            left: 133,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: IconButton(
                icon: const Icon(Icons.qr_code_rounded),
                onPressed: () {
                  Navigator.of(context).push(CustomPageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const MyQrCodeScreen(),
                  ));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
