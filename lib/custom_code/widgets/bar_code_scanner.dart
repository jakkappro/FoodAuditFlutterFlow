// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:camera/camera.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../components/scanner_page_components/sliding_up_panel_from_ean/sliding_up_panel_from_ean_widget.dart';
import '../../components/scanner_page_components/close_scanner_button/close_scanner_button_widget.dart';
import '../../components/scanner_page_components/scan_product_message/scan_product_message_widget.dart';
import 'package:nu3_food/components/scanner_page_components/add_manually_button/add_manually_button_widget.dart';

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
  final Color _mildFoodColor = Colors.yellow.withOpacity(0.5);
  List<String> _requestedEans = [];
  String _currentDisplayedEan = '';
  PanelController _panelController = PanelController();
  ProductsRecord? _scannedFood;
  late Color _backdropColor; //initial color
  bool _panelOpened = false;
  String _ean = '';
  bool isTorchOn = false;
  int _sameUnknownEanScanned = 0;
  bool _shouldShowUnknowEanButton = false;
  bool _foundSomethingUseful = false;

  @override
  void initState() {
    super.initState();
    _backdropColor = _neutralColor;
    _getRequestedEans();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _getRequestedEans() async {
    final t = await queryRequestedEansRecordOnce();
    final requestedEans = t.map((e) => e.ean).toList();
    setState(() {
      _requestedEans = requestedEans;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (details) async {
        // if (details.primaryVelocity! > 0 &&
        //     _foundSomethingUseful &&
        //     !_panelOpened &&
        //     !_panelController.isPanelAnimating) {
        //   _panelOpened = true;
        //   _currentDisplayedEan = _ean;
        //   setState(() {});
        //   await _panelController.animatePanelToPosition(
        //     1,
        //     duration: Duration(milliseconds: 300),
        //   );
        //   return;
        // } else
        if (details.primaryVelocity! < 0 &&
            _panelOpened &&
            !_panelController.isPanelShown &&
            !_panelController.isPanelAnimating) {
          _panelOpened = false;
          _currentDisplayedEan = '';
          setState(() {});
          await _panelController.close();
        }
      },
      onTap: () async {
        if (_foundSomethingUseful &&
            !_panelOpened &&
            !_panelController.isPanelAnimating) {
          await _panelController.animatePanelToPosition(
            1,
            duration: Duration(milliseconds: 300),
          );

          _panelOpened = true;
          _currentDisplayedEan = _ean;
          setState(() {});

          return;
        } else if (_panelOpened &&
            !_panelController.isPanelShown &&
            !_panelController.isPanelAnimating) {
          _panelOpened = false;
          _currentDisplayedEan = '';
          setState(() {});
          await _panelController.close();
        }
      },
      child: SlidingUpPanel(
        controller: _panelController,
        minHeight: 0,
        maxHeight: MediaQuery.of(context).size.height * 0.8,
        panel: _scannedFood != null
            ? SlidingUpPanelFromEanWidget(
                doc: _scannedFood,
                isOpened: _panelOpened,
              )
            : Container(),
        snapPoint: 0.4,
        onPanelClosed: () {
          _panelOpened = false;
        },
        renderPanelSheet: false,
        backdropTapClosesPanel: true,
        backdropColor: Colors.grey,
        backdropEnabled: _panelOpened && !_panelController.isPanelAnimating,
        backdropOpacity: 0.8,
        slideDirection: SlideDirection.DOWN,
        defaultPanelState: PanelState.CLOSED,
        isDraggable: true,
        onPanelOpened: () {
          if (!_panelOpened)
            setState(() {
              _panelOpened = true;
            });
        },
        onPanelSlide: (position) {
          if (position <= 0.5 && _panelOpened) {
            setState(() {
              _panelOpened = false;
            });
          }
          if (position > 0.5 && !_panelOpened) {
            setState(() {
              _panelOpened = true;
            });
          }
        },
        body: Stack(
          children: <Widget>[
            _ScannerPage(
              onEanScanned: _onEanScanned,
              isTorchOn: isTorchOn,
            ),
            ClipPath(
              clipper: HoleClipper(),
              child: Container(
                color: _backdropColor,
              ),
            ),
            Align(
              child: CloseScannerButtonWidget(),
              alignment: Alignment(0.9, 0.9),
            ),
            SizedBox(
              child: ScanProductMessageWidget(),
              width: double.infinity,
              height: 204,
            ),
            Align(
              child: _switchTorchToggle(),
              alignment: Alignment(-0.9, 0.9),
            ),
            Align(
              child: _shouldShowUnknowEanButton
                  ? AddManuallyButtonWidget(
                      ean: _ean,
                      onPressed: () async {
                        _getRequestedEans();

                        setState(() {
                          _shouldShowUnknowEanButton = false;
                        });
                      })
                  : Container(),
              alignment: Alignment(0, 0.9),
            )
          ],
        ),
      ),
    );
  }

  Widget _switchTorchToggle() => SizedBox(
        height: 60.0,
        width: 60.0,
        child: FloatingActionButton(
            heroTag: Object(),
            onPressed: () {
              setState(() {
                isTorchOn = !isTorchOn;
              });
            },
            backgroundColor: Color.fromRGBO(183, 193, 250, 1),
            foregroundColor: Color.fromRGBO(56, 47, 115, 1),
            child: Image.asset(
              "assets/images/lightBulb.png",
              width: 34,
              height: 34,
            )),
      );

  Future<void> _onEanScanned(String ean) async {
    if (_panelOpened) return;
    if (_currentDisplayedEan == ean && ean.isNotEmpty) return;
    if (ean == _ean &&
        ean.isNotEmpty &&
        (_sameUnknownEanScanned == 0 || _sameUnknownEanScanned > 5)) return;

    if (_requestedEans.contains(ean)) {
      // here tell user that this ean was requested already using snackbar that disappiers after some time
      // will translate later to slovak
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('This product was requested already'),
          duration: Duration(seconds: 2),
        ),
      );
      setState(() {
        _sameUnknownEanScanned = 0;
        _ean = ean;
      });
      return;
    }
    if (ean.isEmpty) {
      _backdropColor = _neutralColor;
      _ean = '';
      _foundSomethingUseful = false;

      if (_panelController.isAttached &&
          mounted &&
          _panelController.isPanelShown &&
          !_panelController.isPanelOpen) {
        if (mounted)
          setState(() {
            _backdropColor = _neutralColor;
            _ean = '';
            _foundSomethingUseful = false;
          });

        await _panelController.animatePanelToPosition(
          0,
          duration: Duration(milliseconds: 200),
        );
        _panelOpened = false;

        if (mounted)
          setState(() {
            _scannedFood = null;
          });
      }
      return;
    }

    final scannedFood = await getFoodFromEAN(ean, true);

    if (scannedFood != null) {
      _foundSomethingUseful = true;
      var isSafe = await isFoodSafe(scannedFood!.allergens);
      var isFineWithDrugs = await isDrugComplient(scannedFood!);
      _backdropColor = !isSafe
          ? _dangerounsFoodColor
          : !isFineWithDrugs
              ? _mildFoodColor
              : _safeFoodColor;
      _shouldShowUnknowEanButton = false;
      _sameUnknownEanScanned = 0;
      if (_panelController.isAttached &&
          _panelController.isPanelClosed &&
          mounted &&
          !_panelController.isPanelAnimating) {
        await _panelController.animatePanelToSnapPoint(
            duration: Duration(milliseconds: 300));
        _panelOpened = false;
      }
      if (mounted) {
        setState(() {
          _scannedFood = scannedFood;
        });
      }
    } else {
      _backdropColor = _neutralColor;
      if (_ean == ean) {
        _sameUnknownEanScanned++;
      } else {
        _sameUnknownEanScanned = 1;
      }

      _ean = ean;

      if (_sameUnknownEanScanned >= 3) {
        _shouldShowUnknowEanButton = true;
      }

      _scannedFood = null;
      if (mounted) {
        setState(() {});
      }
    }
  }
}

// clipping the center of camera view out
class HoleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var outerPath = Path()
      ..addRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height));

    var innerPath = Path()
      ..addRect(Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width * 0.75,
        height: 250.0,
      ));

    return Path.combine(PathOperation.difference, outerPath, innerPath);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _ScannerPage extends StatefulWidget {
  const _ScannerPage({
    Key? key,
    required this.onEanScanned,
    this.isTorchOn = false,
  }) : super(key: key);

  final Function(String) onEanScanned;
  final bool isTorchOn;

  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<_ScannerPage> {
  CustomPaint? _customPaint;
  var _cameraLensDirection = CameraLensDirection.back;
  final BarcodeScanner _barcodeScanner = BarcodeScanner();

  int _timesDidntFoundEan = 0;
  int _timesFoundEan = 0;

  bool _canProcess = true;
  bool _isBusy = false;

  @override
  Widget build(BuildContext context) {
    return CameraView(
      customPaint: _customPaint,
      onImage: _processImage,
      initialCameraLensDirection: _cameraLensDirection,
      onCameraLensDirectionChanged: (value) => _cameraLensDirection = value,
      isTorchOn: widget.isTorchOn,
    );
  }

  @override
  void dispose() {
    _barcodeScanner.close();
    _canProcess = false;
    super.dispose();
  }

  Future<void> _processImage(InputImage inputImage) async {
    if (!_canProcess) {
      return;
    }
    if (_isBusy) return;
    _isBusy = true;
    // use this later for displaying a message to aim camera to barcode
    setState(() {});
    final barcodes = await _barcodeScanner.processImage(inputImage);
    bool foundEan = barcodes.where((b) => b.displayValue != null).isNotEmpty;

    _isBusy = false;

    if (mounted) {
      // display message after some unsucessfull scans to aim camera to barcode
      setState(() {
        if (foundEan) {
          _timesDidntFoundEan = 0;
          _timesFoundEan++;
          // choose color based on food safety
          if (_timesFoundEan > 5) {
            _timesFoundEan = 0;
            widget.onEanScanned(barcodes.first.displayValue!);
          }
          widget.onEanScanned(barcodes.first.displayValue!);
        } else if (!foundEan && _timesDidntFoundEan > 25) {
          widget.onEanScanned('');
          _timesFoundEan = 0;
        } else {
          _timesDidntFoundEan++;
        }
      });
    }
  }
}
