import 'package:flutter/material.dart';
import 'package:rendom_user/Screen/Provider/Home_Provider.dart';
import 'package:rendom_user/Screen/View/Home_Page.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => HomeProvider(),
      )
    ],
    builder: (context, child) => Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => Home_Screen(),
          },
        );
      },
    ),
  ));
}