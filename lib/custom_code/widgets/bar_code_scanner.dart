// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:nu3_food/components/sliding_up_panel_from_ean/sliding_up_panel_from_ean_widget.dart';

import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:camera/camera.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BarCodeScanner extends StatefulWidget {
  const BarCodeScanner({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _BarCodeScannerState createState() => _BarCodeScannerState();
}

class _BarCodeScannerState extends State<BarCodeScanner>
    with TickerProviderStateMixin {
  final Color _safeFoodColor = Colors.green.withOpacity(0.5);
  final Color _dangerounsFoodColor = Colors.red.withOpacity(0.5);
  final Color _neutralColor = Color(0x1C0D26).withOpacity(0.5);

  late AnimationController _foundFoodOverlayAnimation;
  late AnimationController _cannotFindEanAnimation;
  final BarcodeScanner _barcodeScanner = BarcodeScanner();
  bool _canProcess = true;
  bool _isBusy = false;
  bool _foundFood = false;
  bool _canScan = true;
  String? _ean;
  CustomPaint? _customPaint;
  var _cameraLensDirection = CameraLensDirection.back;
  PanelController _panelController = PanelController();
  ScannedFoodStruct? _scannedFood;
  int _timesDidntFoundEan = 0;
  late Color _backdropColor; //initial color

  @override
  void initState() {
    super.initState();
    _backdropColor = _neutralColor;
    _foundFoodOverlayAnimation = AnimationController(
        duration: const Duration(milliseconds: 750), vsync: this);
    _cannotFindEanAnimation = AnimationController(
        duration: const Duration(milliseconds: 750), vsync: this);
  }

  @override
  void dispose() {
    _canProcess = false;
    _barcodeScanner.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      controller: _panelController,
      minHeight: 0,
      maxHeight: MediaQuery.of(context).size.height * 0.8,
      panel: _scannedFood != null
          ? SlidingUpPanelFromEanWidget(food: _scannedFood)
          : Container(),
      backdropTapClosesPanel: true,
      backdropColor: Colors.grey,
      backdropEnabled: true,
      backdropOpacity: 0.8,
      slideDirection: SlideDirection.DOWN,
      isDraggable: true,
      onPanelClosed: _onPanelClose,
      onPanelOpened: () async {
        _canScan = false;
        await _foundFoodOverlayAnimation.reverse();
        await _cannotFindEanAnimation.reverse();
      },
      body: GestureDetector(
        onVerticalDragEnd: (details) async {
          if (details.primaryVelocity! < 0 && _foundFood) {
            await _panelController.open();
          }
        },
        child: Stack(
          children: <Widget>[
            CameraView(
              customPaint: _customPaint,
              onImage: _processImage,
              initialCameraLensDirection: _cameraLensDirection,
              onCameraLensDirectionChanged: (value) =>
                  _cameraLensDirection = value,
            ),
            ClipPath(
              clipper: HoleClipper(),
              child: Container(
                color: _backdropColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _updateScannedFood(String ean) async {
    if (ean == _ean) return;
    final newFood = await getFoodFromEAN(ean);
    if (newFood != null) {
      setState(() {
        _scannedFood = newFood;
        _foundFood = true;
      });
    }
  }

  Future<void> _processImage(InputImage inputImage) async {
    if (!_canProcess && _canScan) {
      return;
    }
    if (_isBusy) return;
    _isBusy = true;
    // use this later for displaying a message to aim camera to barcode
    bool foundEan = false;
    setState(() {});
    final barcodes = await _barcodeScanner.processImage(inputImage);
    Barcode? eanBarcode;
    for (final barcode in barcodes.where((b) => b.displayValue != null)) {
      // we can also check barcode.type but not sure how it works yet and don't care to try
      eanBarcode = barcode;
      foundEan = true;
      _updateScannedFood(eanBarcode.displayValue!);
    }

    _isBusy = false;
    if (!_canScan) {
      return;
    }

    if (mounted && _canScan) {
      // display message after some unsucessfull scans to aim camera to barcode
      setState(() {
        if (foundEan) {
          _ean = eanBarcode!.displayValue;
          _timesDidntFoundEan = 0;
          // choose color based on food safety
          _backdropColor = Colors.green.withOpacity(0.5);
        } else if (!foundEan && _timesDidntFoundEan > 50) {
          _ean = null;
          _backdropColor = _neutralColor;
        } else {
          _timesDidntFoundEan++;
        }
      });
    }
  }

  // call this on swipe down or when user taps outside of panel
  void _onPanelClose() {
    setState(() {
      _canScan = true;
    });
  }
}

class HoleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var outerPath = Path()
      ..addRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height));

    var innerPath = Path()
      ..addRect(Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: 250.0, // define width of square
        height: 250.0, // define height of square
      ));

    return Path.combine(PathOperation.difference, outerPath, innerPath);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
