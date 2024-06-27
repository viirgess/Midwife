// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String?> getLocationName(
  LatLng location,
  bool isAndroid,
  bool isIOS,
  bool isWeb,
) async {
  late String apiKey;

  if (isAndroid) {
    apiKey = 'AIzaSyC24OZaL4h_epK4k09MBx6Z2WLJ_v9zkpg';
  }
  if (isIOS) {
    apiKey = 'AIzaSyAxePOT15e3e5-3JrR2fPL5PLMKNAPy_V8';
  }
  if (isWeb) {
    apiKey = 'AIzaSyD4O8CQVfy3OV9FVmPWJvdXMC73jeEF_xo';
  }

  final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/geocode/json?latlng=${location.latitude},${location.longitude}&key=$apiKey');

  try {
    final response = await http.get(url);
    debugPrint(response.body);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'] as List;
      debugPrint(results.toString());
      if (results.isNotEmpty) {
        final location = results[0]['address_components'] as List;
        for (var component in location) {
          if (component['types'].contains('locality')) {
            debugPrint(component['long_name']);
            return component['long_name']; // Return city name
          }
        }
      }
      return null; // Address not found or no city information available
    } else {
      // Handle unsuccessful response (e.g., network error)
      return null;
    }
  } catch (error) {
    // Handle exceptions
    return null;
  }
}
