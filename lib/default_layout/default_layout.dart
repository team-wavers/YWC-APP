import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {

  final Widget body;
  const DefaultLayout({
    super.key,
    required this.body
  });

  @override
  Widget build(BuildContext context) {
    //final double appbarHeghit = AppBar().preferredSize.height;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   centerTitle: true,
      //   title: Image.asset(
      //     'assets/images/wavers_logo.png',
      //     height: appbarHeghit - 10,fit: BoxFit.fitHeight,),
      // ),
      body: body
    );
  }
}
