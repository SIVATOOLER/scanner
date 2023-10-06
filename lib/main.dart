import 'package:flutter/material.dart';
import 'package:inventory/config/app_const.dart';
import 'package:inventory/config/app_theme.dart';
import 'package:inventory/config/router.dart';
import 'package:inventory/features/scan_details/screens/scan_details.dart';

import 'features/authentication/screens/authentication.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      theme: AppTheme.lightTheme,
      onGenerateRoute: onGenerateRoute,
      home: const Authentication(),
    );
  }
}
