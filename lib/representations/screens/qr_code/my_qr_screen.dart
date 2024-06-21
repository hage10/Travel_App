import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/representations/widgets/app_bar_container.dart';

class MyQrCodeScreen extends StatefulWidget {
  const MyQrCodeScreen({super.key});

  @override
  State<MyQrCodeScreen> createState() => _MyQrCodeScreenState();
}

class _MyQrCodeScreenState extends State<MyQrCodeScreen> {
  String? data = "innit data";

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: "Flutter QR Code",
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              onChanged: (val) => setState(() => data = val),
              decoration: const InputDecoration(
                labelText: 'Type your data',
              ),
            ),
            const SizedBox(height: 30),
            data != null
                ? QrImageView(
                    data: data.toString(),
                    padding: const EdgeInsets.all(0),
                    embeddedImage: const AssetImage(AssetHelper.icoGoogle),
                    embeddedImageStyle: const QrEmbeddedImageStyle(
                      size: Size(50, 50),
                    ),
                    eyeStyle: const QrEyeStyle(
                      eyeShape: QrEyeShape.circle,
                      color: Colors.black,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
