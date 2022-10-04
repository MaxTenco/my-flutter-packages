library app_boot;

import 'package:flutter/material.dart';

class AppBoot extends StatefulWidget {
  const AppBoot({
    Key? key,
    required this.splashScreen,
    required this.initializeApp,
    required this.onDone,
    required this.onError,
  }) : super(key: key);

  final Widget splashScreen;
  final Future<void> initializeApp;
  final VoidCallback onDone;
  final VoidCallback onError;

  @override
  State<AppBoot> createState() => _AppBootState();
}

class _AppBootState extends State<AppBoot> {
  // **************************************************************************
  // LIFE CYCLE
  // **************************************************************************
  @override
  void initState() {
    super.initState();
    _init();
  }

  // **************************************************************************
  // BUSINESS LOGIC
  // **************************************************************************
  Future<void> _init() async {
    try {
      await widget.initializeApp;
      widget.onDone();
    } catch (e, s) {
      print(e);
      print(s);
      widget.onError();
    }
  }

  // **************************************************************************
  // BUILD
  // **************************************************************************
  @override
  Widget build(BuildContext context) {
    return widget.splashScreen;
  }
}
