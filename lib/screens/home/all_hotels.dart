import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/utils/all_json.dart';
import 'package:ticket_app/base/utils/app_routes.dart';
import 'package:ticket_app/screens/home/widgets/hotel.dart';

class AllHotels extends StatelessWidget {
  const AllHotels({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("All Hotels"),
          backgroundColor: AppStyles.bgColor,
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 1),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 0.78),
                itemCount: hotelList.length,
                itemBuilder: (context, index) {
                  var singleHotel = hotelList[index];
                  return HotelGridView(hotel: singleHotel, index: index,);
                }),
          ),
        ));
  }
}

class HotelGridView extends StatelessWidget {
  final Map<String, dynamic> hotel;
  final int index;
  const HotelGridView({super.key, required this.hotel, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.hotelDetail, arguments: {
          "index" : index
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: AppStyles.primaryColor,
            borderRadius: BorderRadius.circular(18)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.2,
              child: Container(
                decoration: BoxDecoration(
                    color: AppStyles.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/${hotel['image']}"))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                hotel["place"],
                style:
                    AppStyles.headLineStyle4.copyWith(color: AppStyles.kakiColor),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    hotel["destination"],
                    style: AppStyles.headLineStyle4.copyWith(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "\$${hotel["price"].toString()}/night",
                    style: AppStyles.headLineStyle4
                        .copyWith(color: AppStyles.kakiColor),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
