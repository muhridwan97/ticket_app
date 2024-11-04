import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/utils/all_json.dart';

class HotelDetail extends StatefulWidget {
  const HotelDetail({super.key});

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  late int index = 0;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;

    if (args is Map && args.containsKey("index")) {
      index = args["index"];
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppStyles.primaryColor),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              // title: Text(hotelList[index]["place"]),
              background: Stack(
                children: [
                  Positioned.fill(
                      child: Image.asset(
                    "assets/images/${hotelList[index]['image']}",
                    fit: BoxFit.cover,
                  )),
                  Positioned(
                      bottom: 20,
                      right: 20,
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          color: Colors.black.withOpacity(0.4),
                          child: Text(
                            hotelList[index]["place"],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                shadows: [
                                  Shadow(
                                      blurRadius: 5.0,
                                      color: AppStyles.primaryColor,
                                      offset: const Offset(2.0, 2.0))
                                ]),
                          )))
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ExpandedTextWidget(
                text:
                    hotelList[index]["detail"],
              ),
              // Text(
              //     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "More Images",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: hotelList[index]["images"]?.length ?? 0,
                  itemBuilder: (context, indexImage) {
                    return Container(
                      margin: EdgeInsets.all(16),
                        child:  Image.asset("assets/images/${hotelList[index]["images"][indexImage]}"));
                  }),
            ),
          ]))
        ],
      ),
    );
  }
}

class ExpandedTextWidget extends StatefulWidget {
  final String text;

  const ExpandedTextWidget({super.key, required this.text});

  @override
  State<ExpandedTextWidget> createState() => _ExpandedTextWidgetState();
}

class _ExpandedTextWidgetState extends State<ExpandedTextWidget> {
  bool isExpanded = false;
  String expandText = "more";
  _toggleExpansion() {
    setState(() {
      isExpanded = !isExpanded;
    });
    expandText = isExpanded ? "less" : "more";
  }

  @override
  Widget build(BuildContext context) {
    var textWidget = Text(
      textAlign: TextAlign.justify,
      widget.text,
      maxLines: isExpanded ? null : 6,
      overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget,
        GestureDetector(
          onTap: () {
            _toggleExpansion();
          },
          child: Text(
            expandText,
            style: AppStyles.textStyle.copyWith(color: AppStyles.primaryColor),
          ),
        )
      ],
    );
  }
}
