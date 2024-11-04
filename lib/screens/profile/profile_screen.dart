import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/media.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/widgets/app_column_text_layout.dart';
import 'package:ticket_app/base/widgets/heading_text.dart';
import 'package:ticket_app/base/widgets/text_style_third.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            const Padding(padding: EdgeInsets.only(top: 40)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //show logo
                Container(
                  height: 86,
                  width: 86,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: AssetImage(AppMedia.logo))),
                ),
                //show text
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeadingText(
                      text: "Book Tickets",
                      isColor: false,
                    ),
                    Text(
                      "New-York",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade500),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppStyles.profileStatusColor),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(2),
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppStyles.profileTextColor),
                            child: const Icon(
                              size: 15,
                              FluentSystemIcons.ic_fluent_shield_filled,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text("Premium status",
                              style: TextStyle(
                                  color: AppStyles.profileTextColor,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(child: Container()),
                Text(
                  "Edit",
                  style: AppStyles.headLineStyle3
                      .copyWith(color: Colors.grey.shade500),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Divider(
              color: Colors.grey.shade300,
            ),
            const SizedBox(
              height: 8,
            ),
            Stack(
              children: [
                Container(
                  height: 90,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppStyles.primaryColor),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        maxRadius: 25,
                        backgroundColor: Colors.white,
                        child: Icon(
                          FluentSystemIcons.ic_fluent_lightbulb_filament_filled,
                          color: AppStyles.primaryColor,
                          size: 27,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextStyleThird(
                            text: "You'v got a new award",
                          ),
                          Text(
                            "You have 95 flights in a year",
                            style: AppStyles.headLineStyle4.copyWith(
                                color: Colors.white.withOpacity(0.8),
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: -45,
                  top: -40,
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 16, color: const Color(0xFF264CD2))),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              "Accumulated miles",
              style: AppStyles.headLineStyle2,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  const SizedBox(height: 45,),
                  Text(
                    "192802",
                    style: TextStyle(fontSize: 45,color: AppStyles.textColor, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Miles accured",
                          style: AppStyles.headLineStyle4.copyWith(fontSize: 16)),
                      Text("11 June 2022",
                          style: AppStyles.headLineStyle4.copyWith(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 4,),
                  Divider(
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 4,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumnTextLayout(topText: "23 042", bottomText: "Miles", alignment: CrossAxisAlignment.start, isColor: true,),
                      AppColumnTextLayout(topText: "Airline CO", bottomText: "Received from", alignment: CrossAxisAlignment.end, isColor: true,),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumnTextLayout(topText: "24", bottomText: "Miles", alignment: CrossAxisAlignment.start, isColor: true,),
                      AppColumnTextLayout(topText: "McDonal's", bottomText: "Received from", alignment: CrossAxisAlignment.end, isColor: true,),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumnTextLayout(topText: "52 340", bottomText: "Miles", alignment: CrossAxisAlignment.start, isColor: true,),
                      AppColumnTextLayout(topText: "DBestech", bottomText: "Received from", alignment: CrossAxisAlignment.end, isColor: true,),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  InkWell(
                    onTap: (){
                      print("on tap");
                    },
                    child: Text("How to get more miles", style: AppStyles.headLineStyle3.copyWith(color: AppStyles.primaryColor,))),

                ],
              ),
            ),
          ]),
    );
  }
}
