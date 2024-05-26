import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FoodSpotWidget extends StatelessWidget {
  const FoodSpotWidget(
      {required this.name,
      required this.phone,
      required this.address,
      super.key});
  final String name;
  final Uri phone;
  final Uri address;

  @override
  Widget build(BuildContext context) {
    final foodImage = Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.3,
          child: Image.asset("assets/images/food.png")),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.symmetric(
                horizontal: BorderSide(
                    width: 1,
                    color: Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.1)))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            foodImage,
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style:
                        const TextStyle(color: Color(0xFF2B8DA3), fontSize: 20),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    child: const Text("Minim pariatur eiusmod culpa "
                        "deserunt amet culpa adipisicing ut "
                        "magna sint est. Nostrud veniam nisi cillum"),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () async {
                      await _launchUrl(phone);
                    },
                    icon: Icon(
                      Icons.phone,
                      color: Theme.of(context).colorScheme.primary,
                    )),
                IconButton(
                    onPressed: () async {
                      await _launchUrl(address);
                    },
                    icon: Icon(
                      Icons.place,
                      color: Theme.of(context).colorScheme.primary,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      launchUrl(url);
    }
  }
}
