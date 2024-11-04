import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/utils/all_json.dart';
import 'package:ticket_app/base/utils/app_routes.dart';
import 'package:ticket_app/base/widgets/ticket_view.dart';

class AllTickets extends StatelessWidget {
  const AllTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Tickets"),
        backgroundColor: AppStyles.bgColor,
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Column(
              children: ticketList
                  .map((singleElement) => GestureDetector(
                        onTap: () {
                          var index = ticketList.indexOf(singleElement);
                          print("on tap $index");
                          Navigator.pushNamed(context, AppRoutes.ticketScreen,
                              arguments: {"index": index});
                        },
                        child: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: TicketView(
                              ticket: singleElement,
                              wholeScreen: true,
                            )),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
