import 'package:flutter/material.dart';
import 'package:inventory/config/app_color.dart';
import 'package:inventory/config/app_const.dart';
import 'package:inventory/config/app_style.dart';

import '../../../config/app_layout.dart';
import '../../../config/app_routes.dart';
import '../../../utils/cus_textfield.dart';
import '../../../widgets/singlecolor_button.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                15, 15, 15, MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    AppString.appName,
                    style: AppStyle(context).headingLargeBold.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        letterSpacing: 2,
                        color: AppColor.greenHeading),
                  ),
                ),
                AppLayout.spaceH10,
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/image/categories/inventory_image.png"))),
                ),
                AppLayout.spaceH30,
                // Text(
                //   ' Username / E-mail',
                //   style: AppStyle(context).titleSmall,
                // ),
                // AppLayout.spaceH10,
                const MyTextField(
                  prefix: Icon(Icons.person),
                  hint: "Username / E-mail",
                  inputkeybordtype: null,
                  length: null,
                  suffixIcon: null,
                  align: TextAlign.start,
                  vertAlign: TextAlignVertical.center,
                ),
                // AppLayout.spaceH10,
                // Text(
                //   ' Password',
                //   style: AppStyle(context).titleSmall,
                // ),
                AppLayout.spaceH10,
                const MyTextField(
                  prefix: Icon(Icons.key),
                  obstext: true,
                  hint: "Password",
                  inputkeybordtype: null,
                  length: null,
                  suffixIcon: null,
                  align: TextAlign.start,
                  vertAlign: TextAlignVertical.center,
                ),
                AppLayout.spaceH30,
                SingleColorButton(
                  width: MediaQuery.of(context).size.width,
                  text: "Log In",
                  function: () {
                    Navigator.pushNamed(context, AppRoutes.home);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
