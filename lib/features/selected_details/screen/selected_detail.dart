import 'package:flutter/material.dart';

import '../../../config/app_const.dart';


class SelectedDetails extends StatefulWidget {
  const SelectedDetails({super.key});

  @override
  State<SelectedDetails> createState() => _SelectedDetailsState();
}

class _SelectedDetailsState extends State<SelectedDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.appName),
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}