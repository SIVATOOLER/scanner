import 'package:flutter/material.dart';
import 'package:inventory/config/app_color.dart';
import 'package:inventory/config/app_const.dart';
import 'package:inventory/config/app_layout.dart';
import 'package:inventory/config/app_routes.dart';
import 'package:inventory/config/app_style.dart';

import '../../../utils/cus_textfield.dart';

class ScannerDetails extends StatefulWidget {
  const ScannerDetails({super.key});

  @override
  State<ScannerDetails> createState() => _ScannerDetailsState();
}

class _ScannerDetailsState extends State<ScannerDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.appName),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    //height: ,
                    color: AppColor.listColor,
                    child: Row(
                      children: [
                        AppLayout.spaceW10,
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: "Total Spaces : ",
                              style: AppStyle(context)
                                  .headingMediumBold
                                  .copyWith(fontSize: 17),
                            ),
                            TextSpan(
                              text: "20",
                              style: AppStyle(context)
                                  .headingMediumBold
                                  .copyWith(
                                      fontSize: 17, color: AppColor.greenText),
                            )
                          ]),
                        ),
                        AppLayout.spaceW30,
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: "Used Spaces : ",
                              style: AppStyle(context)
                                  .headingMediumBold
                                  .copyWith(fontSize: 17),
                            ),
                            TextSpan(
                              text: "20",
                              style: AppStyle(context)
                                  .headingMediumBold
                                  .copyWith(
                                      fontSize: 17, color: AppColor.greenText),
                            )
                          ]),
                        ),
                        AppLayout.spaceW30,
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: "Empty Spaces : ",
                              style: AppStyle(context)
                                  .headingMediumBold
                                  .copyWith(fontSize: 17),
                            ),
                            TextSpan(
                              text: "20",
                              style: AppStyle(context)
                                  .headingMediumBold
                                  .copyWith(
                                      fontSize: 17, color: AppColor.greenText),
                            )
                          ]),
                        ),
                        AppLayout.spaceW30,
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        color: AppColor.black,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 10,
                child: SizedBox(
                  child: ListView.builder(
                      itemCount: 30,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.selectedDetails);
                            },
                            child: ListTile(
                              tileColor: AppColor.listColor,
                              leading: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                color: AppColor.backgroundGreen,
                                child: const Padding(
                                  padding: AppLayout.cardPadding,
                                  child: Icon(
                                    Icons.inventory,
                                    size: 40,
                                  ),
                                ),
                              ),
                              title: Text(
                                "ProductName",
                                style: AppStyle(context)
                                    .headingLargeBold
                                    .copyWith(color: AppColor.greenHeading),
                              ),
                              subtitle: Text(
                                "Available stock : 12",
                                style: AppStyle(context)
                                    .headingsmallBold
                                    .copyWith(color: AppColor.greenText),
                              ),
                              trailing: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.delete_rounded,
                                    size: 30,
                                    color: AppColor.redIcon,
                                  )),
                            ),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
