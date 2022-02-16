import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability, 
  }) : super(key: key);

  get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
      case Complexity.Challenging:
        return "Challenging";
      case Complexity.Hard:
        return "Hard";
      default:
        return "Unknow";
    }
  }

  get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
      case Affordability.Pricey:
        return "Pricey";
      case Affordability.Luxurious:
        return "Luxurious";
      default:
        return "Unknow";
    }
  }

  void mealDetailScreen(BuildContext ctx) {
    Navigator.pushNamed(
      ctx,
      MealDetailScreen().routeName,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        mealDetailScreen(context);
      },
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.4),
                          Colors.black,
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 6,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work_outline_rounded),
                      const SizedBox(
                        width: 6,
                      ),
                      Text('$complexityText'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money_outlined),
                      const SizedBox(
                        width: 6,
                      ),
                      Text('$affordabilityText'),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
