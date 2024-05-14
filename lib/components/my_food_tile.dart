import 'dart:ffi';

import 'package:flutter/material.dart';

import '../models/food.dart';
class FoodTile extends StatelessWidget {

  final Food food;
  final  void Function ()?onTap;
  const FoodTile({super.key, required this.food, this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(food.name),
                    Text('\$${food.price.toString()}',
                    style: TextStyle(color: Theme.of(context).colorScheme.primary),
                    ),
                    const SizedBox(height: 20),
                    Text(food.description,
                      style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                    ),

                  ],
                ),
                ),
                const SizedBox(height: 20),
                //foood Image
                ClipRRect(
                  borderRadius : BorderRadius.circular(10),
                child: Image.asset(food.imagePath,height: 120,width: 120,),
               )
              ],
            ),
          ),
        ),
        Divider( color: Theme.of(context).colorScheme.primary,
        endIndent: 25,
          indent: 25,
        ),

      ],
    );
  }
}
