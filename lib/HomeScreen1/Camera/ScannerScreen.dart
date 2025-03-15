import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class ScannerScreen extends StatefulWidget {
  @override
  _ScannerScreenState createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  final MobileScannerController cameraController = MobileScannerController(
    facing: CameraFacing.back, // Ensure back camera is used
  );
  bool isProcessing = false;

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) async {
    if (isProcessing) return;

    final Barcode? barcode = capture.barcodes.firstOrNull; // Safely get the first barcode.
    final String? rawValue = barcode?.rawValue;

    if (rawValue != null && rawValue.isNotEmpty) {
      setState(() {
        isProcessing = true;
      });

      debugPrint('Barcode detected: $rawValue');

      // Ensure the URL starts with a valid scheme
      String url = rawValue;
      if (!url.startsWith('http://') && !url.startsWith('https://')) {
        url = 'https://$url';
      }

      final Uri uri = Uri.parse(url);
      debugPrint('Parsed URL: $uri');

      // Display the detected barcode data
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('QR Code Detected'),
          content: Text('Value: $url'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  isProcessing = false;
                });
              },
              child: Text('OK'),
            ),
            TextButton(
              onPressed: () async {
                try {
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Could not launch $url')),
                    );
                  }
                } catch (e) {
                  debugPrint('Error launching URL: $e');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: $e')),
                  );
                } finally {
                  Navigator.of(context).pop();
                  setState(() {
                    isProcessing = false;
                  });
                }
              },
              child: Text('Go to Website'),
            ),
          ],
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Real-Time QR Code Scanner'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.flash_on),
            onPressed: () => cameraController.toggleTorch(),
          ),
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: cameraController,
            onDetect: _onDetect,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.purple, width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned(
            bottom: 90,
            left: 130,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.file_upload, color: Colors.white),
                  onPressed: () {
                    // Handle upload QR functionality
                  },
                ),
                IconButton(
                  icon: Icon(Icons.flashlight_on, color: Colors.white),
                  onPressed: () => cameraController.toggleTorch(),
                ),
              ],
            ),
          ),
          if (isProcessing)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
