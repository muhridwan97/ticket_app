import 'package:flutter/material.dart';

class AppTicketTabs extends StatefulWidget {
  final String firstTab;
  final String secondTab;
  const AppTicketTabs({super.key, required this.firstTab, required this.secondTab});

  @override
  State<AppTicketTabs> createState() => _AppTicketTabsState();
}

class _AppTicketTabsState extends State<AppTicketTabs> {
  bool isAirlineTicketActive = true; // Initial active tab

  void toggleTab(bool isAirlineTab) {
    setState(() {
      isAirlineTicketActive = isAirlineTab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: const Color(0xFFF4F6FD),
      ),
      child: Row(
        children: [
          InkWell(
              onTap: () => toggleTab(true),
              child: Apptabs(
                tabText: widget.firstTab,
                tabBorder: true,
                tabActive: isAirlineTicketActive,
              )),
          InkWell(
              onTap: () => toggleTab(false),
              child: Apptabs(
                tabText: widget.secondTab,
                tabBorder: false,
                tabActive: !isAirlineTicketActive,
              )),
        ],
      ),
    );
  }
}

class Apptabs extends StatelessWidget {
  final String tabText;
  final bool tabBorder;
  final bool tabActive;
  const Apptabs(
      {super.key,
      this.tabText = "",
      this.tabBorder = false,
      this.tabActive = false});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7),
      width: size.width * .44,
      decoration: BoxDecoration(
          color: tabActive == true ? Colors.white : Colors.transparent,
          borderRadius: tabBorder == true
              ? const BorderRadius.horizontal(left: Radius.circular(50))
              : const BorderRadius.horizontal(right: Radius.circular(50))),
      child: Center(child: Text(tabText)),
    );
  }
}
