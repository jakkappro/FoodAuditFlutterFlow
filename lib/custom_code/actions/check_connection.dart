// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// my imports
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mongo_dart/mongo_dart.dart';

Future<bool> checkConnection() async {
  final connectivityResult = await (Connectivity().checkConnectivity());
  switch (connectivityResult) {
    case ConnectivityResult.mobile:
    case ConnectivityResult.wifi:
    case ConnectivityResult.vpn:
      // case ConnectivityResult.other for ios when on vpn but it could cause trouble because this state is ambigous
      // wifi up, try to connect to db
      // not sure if check errors here
      await DatabaseManager().openConnection();
      return true;
    default:
      return false;
  }
}

class DatabaseManager {
  static final DatabaseManager _instance = DatabaseManager._internal();
  late Db db;

  factory DatabaseManager() {
    return _instance;
  }

  DatabaseManager._internal() {
    // Initialize your database connection here
    db = Db(
        'mongodb://[machineAdmin:Heslo123456789!.,#@]4.234.153.147:2004/off');
  }

  Future<void> openConnection() async {
    if (!db.isConnected) {
      await db.open();
    }
  }

  Future<void> closeConnection() async {
    if (db.isConnected) {
      await db.close();
    }
  }

  Future<Map<String, dynamic>?> getProductById(String productId) async {
    await openConnection();
    var collection = db.collection('products');

    var product = await collection.findOne(where.eq('_id', productId));
    //await closeConnection();  // Not sure here for now i keep it but it might be good idea to keep it open

    return product;
  }
}
