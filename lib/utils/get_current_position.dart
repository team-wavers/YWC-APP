import 'package:geolocator/geolocator.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:ywc_app/screens/webview_screen.dart';

void getCurrentPositon(message) async {
  WebViewController controller = WebviewScreen.controller;
  if(message == 'getLocation'){
    await Geolocator.requestPermission();

      LocationPermission permit = await Geolocator.checkPermission();
      String permitStr = permit.toString();

      if(permitStr != "LocationPermission.denied" && permitStr != "LocationPermission.deniedForever") {
        Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        String lat = position.latitude.toString();
        String lon = position.longitude.toString();
        controller.runJavaScript('getLocation($lat, $lon)');
      } else {
        controller.runJavaScript('getLocation("0", "0")');
      }
    }
  }