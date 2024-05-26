import 'package:astu/view/pages/food_spots/widgets/foodspotWidget.dart';
import 'package:flutter/material.dart';

class FoodSpots extends StatelessWidget {
  const FoodSpots({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri mommysAddres =
        Uri.parse("https://maps.app.goo.gl/H8VQWpcyfuqdfm9U9");
    final Uri burtesAddress =
        Uri.parse("https://maps.app.goo.gl/H8VQWpcyfuqdfm9U9");
    final Uri barchsAddress =
        Uri.parse("https://maps.app.goo.gl/EfPLrHmFLNFELgVb7");
    final Uri bontusAddress =
        Uri.parse("https://maps.app.goo.gl/kzjdTz713SDJ4hm89");
    final mommysPhone = Uri(scheme: "tel", path: "+251922321792");

    final burtesPhone = Uri(scheme: "tel", path: "+251941539310");
    final barichsPhone = Uri(scheme: "tel", path: "+251993277564");
    final bontusPhone = Uri(scheme: "tel", path: "251922830449");
    return SingleChildScrollView(
      child: Column(
        children: [
          FoodSpotWidget(
              name: "Mommy", phone: mommysPhone, address: mommysAddres),
          FoodSpotWidget(
              name: "Burte", phone: burtesPhone, address: burtesAddress),
          FoodSpotWidget(
              name: "Barich", phone: barichsPhone, address: barchsAddress),
          FoodSpotWidget(
              name: "Bontu", phone: bontusPhone, address: bontusAddress),
        ],
      ),
    );
  }
}
