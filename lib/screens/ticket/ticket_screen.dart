import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/media.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/utils/all_json.dart';
import 'package:ticket_app/base/widgets/app_column_text_layout.dart';
import 'package:ticket_app/base/widgets/app_layout_builder_widget.dart';
import 'package:ticket_app/base/widgets/ticket_view.dart';
import 'package:ticket_app/screens/search/widgets/app_ticket_tabs.dart';
import 'package:ticket_app/screens/ticket/widgets/ticket_position_circle.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  late int ticketIndex = 0;

  @override
  void didChangeDependencies() {
    // Mendapatkan arguments dari route, pastikan tidak null dan bertipe Map
    final args = ModalRoute.of(context)?.settings.arguments;

    if (args is Map && args.containsKey("index")) {
      ticketIndex = args["index"];
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      appBar: AppBar(
        title: const Text("Ticket"),
        backgroundColor: AppStyles.bgColor,
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            children: [
              // const SizedBox(
              //   height: 40,
              // ),
              // Text(
              //   "Tickets",
              //   style: AppStyles.headLineStyle1,
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
              const AppTicketTabs(
                firstTab: "Upcoming flight",
                secondTab: "Previous flight",
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 16),
                child: TicketView(
                  ticket: ticketList[ticketIndex],
                  isColor: true,
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                color: AppStyles.ticketColor,
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(
                          topText: "Flutter DB",
                          bottomText: "Passenger",
                          alignment: CrossAxisAlignment.start,
                          isColor: true,
                        ),
                        AppColumnTextLayout(
                            topText: "20 0202 021",
                            bottomText: "Passport",
                            alignment: CrossAxisAlignment.end,
                            isColor: true),
                      ],
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: const AppLayoutBuilderWidget(
                          randomDivider: 16,
                          width: 6,
                          isColor: true,
                        )),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(
                          topText: "39230 392049300",
                          bottomText: "Number of E-ticket",
                          alignment: CrossAxisAlignment.start,
                          isColor: true,
                        ),
                        AppColumnTextLayout(
                            topText: "2B93K09",
                            bottomText: "Booking code",
                            alignment: CrossAxisAlignment.end,
                            isColor: true),
                      ],
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: const AppLayoutBuilderWidget(
                          randomDivider: 16,
                          width: 6,
                          isColor: true,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  AppMedia.visaCard,
                                  scale: 11,
                                ),
                                Text(
                                  " *** 08273",
                                  style: AppStyles.headLineStyle3,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Payment method",
                              style: AppStyles.headLineStyle4
                                  .copyWith(color: Colors.grey.shade500),
                            )
                          ],
                        ),
                        const AppColumnTextLayout(
                            topText: "\$249.99",
                            bottomText: "Price",
                            alignment: CrossAxisAlignment.end,
                            isColor: true),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              //bottom of ticket section
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppStyles.ticketColor,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(21),
                      bottomRight: Radius.circular(21)),
                ),
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: BarcodeWidget(
                      height: 80,
                      data: "https://sepakat.purbalinggakab.go.id",
                      barcode: Barcode.code128(),
                      drawText: false,
                      color: AppStyles.textColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.only(left: 16),
                child: TicketView(
                  ticket: ticketList[ticketIndex],
                ),
              ),
            ],
          ),
          const TicketPositionCircle(
            pos: true,
          ),
          const TicketPositionCircle(
            pos: false,
          ),
        ],
      ),
    );
  }
}
