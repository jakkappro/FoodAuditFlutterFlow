// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:xml/xml.dart';
import 'package:http/http.dart' as http;

Future<List<EURssFeedModelStruct>> parseXml() async {
  // get https://webgate.ec.europa.eu/rasff-window/backend/public/consumer/rss/all/ map
// Make an HTTP request to get the XML data
  final response = await http.get(Uri.parse(
      'https://webgate.ec.europa.eu/rasff-window/backend/public/consumer/rss/all/'));

  // // Parse the XML data using the xml package
  final document = XmlDocument.parse(response.body);

  // Get the list of items from the XML data
  final items = document.findAllElements('item');

  // // Create a list to store the parsed data
  final rssFeeds = <EURssFeedModelStruct>[];

  // // Loop through each item and parse the data
  for (final item in items) {
    final title = item.findElements('title').single.value;
    final link = item.findElements('link').single.value;

    // Create a new EURssFeedModelStruct object and add it to the list
    rssFeeds.add(EURssFeedModelStruct(title: title, link: link));
  }

  // Return the list of parsed data
  return rssFeeds;
}
