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

import 'package:nu3_food/components/sliding_up_panel_from_ean_widget.dart';

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

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

class _BarCodeScannerState extends State<BarCodeScanner> {
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
      panel: SlidingUpPanelFromEanWidget(food: _scannedFood ?? null),
      body: GestureDetector(
        onVerticalDragEnd: (details) async {
          if (details.primaryVelocity! < 0 && _foundFood) {
            _canScan = false;
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
            if (_foundFood) _buildFoundFoodWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildFoundFoodWidget() {
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
                children: _scannedFood!.allergens
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
                  _scannedFood!.nu3Socre,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  _scannedFood!.nova4,
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
    switch (_scannedFood!.bin) {
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
    if (!_canProcess && _canScan) return;
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
    if (mounted) {
      // display message after some unsucessfull scans to aim camera to barcode
      setState(() {
        if (foundEan) {
          _ean = eanBarcode!.displayValue;
        }
      });
    }
  }
}
