import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ywc_app/default_layout/default_layout.dart';
import 'package:ywc_app/screens/webview_screen.dart';
import 'package:ywc_app/utils/get_current_position.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YWC-APP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}


class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(body: WebviewScreen());
  }
}

