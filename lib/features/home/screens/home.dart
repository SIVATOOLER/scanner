import 'package:flutter/material.dart';
import 'package:inventory/config/app_color.dart';
import 'package:inventory/config/app_const.dart';
import 'package:inventory/config/app_layout.dart';
import 'package:inventory/config/app_routes.dart';
import 'package:inventory/config/app_style.dart';
import 'package:inventory/utils/cus_textfield.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: AppLayout.containerPadding,
        child: FloatingActionButton(
          isExtended: true,
          backgroundColor: AppColor.buttonColor,
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.scanner);
          },
          child: const Icon(
            Icons.qr_code_scanner_rounded,
            size: 40,
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text(AppString.appName),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              15, 15, 15, MediaQuery.of(context).viewInsets.bottom),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.88,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  color: AppColor.backgroundGreen,
                  child: Padding(
                    padding: AppLayout.cardPadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              "12",
                              style: AppStyle(context).headingsmall.copyWith(
                                  fontSize: 30, fontWeight: FontWeight.w100),
                            ),
                            Text(
                              "No of items",
                              style: AppStyle(context).headingMedium.copyWith(),
                            ),
                          ],
                        ),
                        Container(
                          width: 3,
                          height: MediaQuery.of(context).size.height * 0.1,
                          color: AppColor.greyText,
                        ),
                        Column(
                          children: [
                            Text(
                              "15",
                              style: AppStyle(context).headingsmall.copyWith(
                                  fontSize: 30, fontWeight: FontWeight.w100),
                            ),
                            Text(
                              "Total items",
                              style: AppStyle(context).headingMedium.copyWith(),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                AppLayout.spaceH10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: const MyTextField(
                          prefix: Icon(Icons.search_rounded),
                          hint: "Search Product......",
                          inputkeybordtype: null,
                          length: null,
                          suffixIcon: null,
                          align: TextAlign.start,
                          vertAlign: TextAlignVertical.center),
                    ),
                    AppLayout.smallW,
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.import_export,
                        size: 35,
                        color: AppColor.darkGrey,
                      ),
                    )
                  ],
                ),
                AppLayout.spaceH10,
                Text(
                  "Products View",
                  style: AppStyle(context).headingLargeBold.copyWith(
                        fontSize: 20,
                      ),
                ),
                AppLayout.spaceH10,
                Expanded(
                  child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              childAspectRatio: 5 / 4.5),
                      itemCount: 15,
                      itemBuilder: ((context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: const LinearGradient(colors: [
                                AppColor.greenHeading,
                                AppColor.primary
                              ])),
                          child: Padding(
                            padding: AppLayout.containerPadding,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.white70,
                                  child: Padding(
                                    padding: AppLayout.cardPadding,
                                    child: Image.asset(
                                        "assets/image/categories/inventory_image.png"),
                                  ),
                                ),
                                Text(
                                  "ProductName",
                                  style: AppStyle(context)
                                      .headingMediumBold
                                      .copyWith(
                                          color: AppColor.white, fontSize: 17),
                                ),
                                Text(
                                  "12/15",
                                  style: AppStyle(context).bodysmall.copyWith(
                                      color: AppColor.highLightedGreen,
                                      fontSize: 15),
                                )
                              ],
                            ),
                          ),
                        );
                      })),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
