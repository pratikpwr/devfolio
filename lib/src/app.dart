import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:portfolio/palette.dart';
import 'package:portfolio/src/features/home/screens/home_screen.dart';

import 'core/theme/text_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: MaterialApp(
        title: 'Pratik Pawar PortFolio',
        theme: ThemeData(
          // brightness: Brightness.dark,
          // scaffoldBackgroundColor: Palette.canvasColor,
          // primaryColor: Palette.primaryColor,
          // fontFamily: "GoogleSansRegular",
          textTheme: textTheme,
        ),
        debugShowCheckedModeBanner: false,
        home: const PreLoader(),
      ),
    );
  }
}

class PreLoader extends StatefulWidget {
  const PreLoader({super.key});

  @override
  _PreLoaderState createState() => _PreLoaderState();
}

class _PreLoaderState extends State<PreLoader> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: kDebugMode ? 0 : 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HomeScreen(),
          if (isLoading)
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Palette.canvasColor,
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(Palette.primaryColor),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
