
import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealCard extends StatelessWidget {
  final Meal meal;
  final VoidCallback onTap;

  const MealCard({
    super.key,
    required this.meal,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Expanded(
            child: Hero(
              tag: meal.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  meal.thumb,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(6),
            child: Text(
              meal.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

