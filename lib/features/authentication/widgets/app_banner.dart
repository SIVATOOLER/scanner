import 'package:flutter/material.dart';
import 'package:inventory/config/app_color.dart';

class AppBanner extends StatelessWidget {
  const AppBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColor.primary, Colors.yellow],
              ).createShader(bounds);
            },
            child: const Stack(
              children: [
                Icon(
                  Icons.warehouse,
                  color: AppColor.primary,
                  size: 95,
                ),
                Icon(
                  Icons.warehouse,
                  color: Colors.white,
                  size: 90,
                ),
              ],
            ),
          ),
          // Text(
          //   "Your Ultimate Grocery Shopping App",
          // ),
        ],
      ),
    );
  }
}
