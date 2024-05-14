import 'package:dashlet_deliveries/components/my_quantity_selector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart_item.dart';
import '../models/restaurant.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return  Consumer<Restaurant>(
      builder : (context,restaurant,child)=>Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
        ),
      margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                //food Image
                ClipRRect(
                    child: Image.asset(cartItem.food.imagePath,height: 100,width: 50,)),
                     const SizedBox(width: 10),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //name and price
                    Text(cartItem.food.name),

                    //price
                    Text('\$' +cartItem.food.price.toString(),
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,

                    ),
                    ),
                  ],
                ),
                const Spacer(),


                //increment or decrement quantity
                QuantitySelector(
                    quantity: cartItem.quantity,
                    food: cartItem.food,
                    onIncrement: (){
                      restaurant.addToCart(cartItem.food, cartItem.selectedAddons);
                    },
                    onDecrement: (){
                      restaurant.removeFromCart(cartItem);
                    }
                ),

              ],
            ),
          ),

          //Addons
          SizedBox(
            height: cartItem.selectedAddons.isEmpty?0:60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left:10,bottom: 10,right: 10),
              children:  cartItem.selectedAddons
                  .map( (addon) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: FilterChip(
                          label: Row(
                            children: [
                              //addon name
                              Text(addon.name),
                              //addon price
                              Text('(\$${addon.price})'),

                            ],
                          ),
                          shape: StadiumBorder(
                            side: BorderSide(
                                color: Theme.of(context).colorScheme.primary)),

                          onSelected: (value) {},
                                    backgroundColor:   Theme.of(context).colorScheme.secondary,
                                    labelStyle: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 12
                                    ),
                                    ),
                  ),
              ).toList(),

            ),
          )
        ],
      ),
        //increment or
    ),
    );
  }
}
