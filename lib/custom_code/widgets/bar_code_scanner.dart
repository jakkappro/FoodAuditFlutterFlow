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
  late AnimationController _foundFoodOverlayAnimation;
  late AnimationController _cannotFindEanAnimation;
  final BarcodeScanner _barcodeScanner = BarcodeScanner();
  bool _canProcess = true;
  bool _isBusy = false;
  bool _foundFood = false;
  bool _panelOpened = false;
  bool _canScan = true;
  bool _missingEanAlertDisplayed = false;
  String? _ean;
  CustomPaint? _customPaint;
  var _cameraLensDirection = CameraLensDirection.back;
  PanelController _panelController = PanelController();
  ScannedFoodStruct? _scannedFood;
  int _timesDidntFoundEan = 0;

  @override
  void initState() {
    super.initState();
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
      isDraggable: true,
      onPanelClosed: _onPanelClose,
      onPanelOpened: () async {
        _canScan = false;
        _panelOpened = true;
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
            FadeTransition(
              opacity: _foundFoodOverlayAnimation,
              child: _foundFood && !_panelOpened
                  ? FoodOverlay(scannedFood: _scannedFood!)
                  : Container(),
            ),
            FadeTransition(
              opacity: _cannotFindEanAnimation,
              child: !_foundFood && !_panelOpened
                  ? MissingEanOverlay()
                  : Container(),
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
      await _cannotFindEanAnimation.reverse();
      setState(() {
        _missingEanAlertDisplayed = false;
        _scannedFood = newFood;
        _foundFood = true;
      });
      _foundFoodOverlayAnimation.forward();
    }
  }

  Future<void> _cantFindEan() async {
    if (_missingEanAlertDisplayed) return;

    await _foundFoodOverlayAnimation.reverse();
    _cannotFindEanAnimation.forward();
    _missingEanAlertDisplayed = true;
    _foundFood = false;
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
        } else if (!foundEan && _timesDidntFoundEan > 50) {
          _ean = null;
          _cantFindEan();
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
      _panelOpened = false;
    });
  }
}

class MissingEanOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 10,
          left: 0,
          right: 0,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            color: Colors.white,
            child: Text(
              "Aim camera to barcode",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

class FoodOverlay extends StatelessWidget {
  const FoodOverlay({
    Key? key,
    required this.scannedFood,
  }) : super(key: key);

  final ScannedFoodStruct scannedFood;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 50,
            child: Center(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: scannedFood.allergens
                    .map(
                      (allergen) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            allergen,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 150,
          left: 5,
          child: Container(
            child: Column(
              children: [
                Text(
                  scannedFood.nu3Socre,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  scannedFood.nova4,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 5,
          bottom: 0,
          top: 0,
          child: Icon(
            Icons.delete,
            color: _getBinColor(),
          ),
        ),
      ],
    );
  }

  Color _getBinColor() {
    switch (scannedFood.bin) {
      case "Red":
        return Colors.red;
      case "Yellow":
        return Colors.yellow;
      case "Green":
        return Colors.green;
      default:
        return Colors.white;
    }
  }
}
