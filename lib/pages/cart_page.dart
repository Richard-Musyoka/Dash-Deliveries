import 'package:dashlet_deliveries/components/my_button.dart';
import 'package:dashlet_deliveries/components/my_cart_tile.dart';
import 'package:dashlet_deliveries/models/restaurant.dart';
import 'package:dashlet_deliveries/pages/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Consumer<Restaurant>(
      builder: (context,restaurant,child){
        //cart
        final userCart = restaurant.cart;

        //Scaffold UI
        return Scaffold(
          appBar: AppBar(
            title: const Text("Cart"),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              //clear all cart button
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context)=>AlertDialog(
                          title: const Text("Are you sure you want to clear the Cart?"),
                          actions: [
                            //cancel button
                            TextButton(
                                onPressed: () =>Navigator.pop(context),
                                child: const Text("Cancel"),
                            ),

                            //Confirm button
                            TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              restaurant.clearCart();
                            }, child: const Text ("Yes"),
                          ),

                          ],
                        ),
                    );
                  },

                  icon: const Icon(Icons.delete),
              )
            ],
          ),
          body: Column(
            //list of cart
            children: [
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty ? const Expanded(child: const Center(child: Text("Cart is Empty ..."))):
                    Expanded(
                        child:
                        ListView.builder(
                        itemCount : userCart.length,
                        itemBuilder: (context ,index){
                          final cartItem = userCart[index];
                          //return cart tile
                           return MyCartTile(cartItem: cartItem);
                
                        },
                
                    ),
                    ),
                  ],
                ),
              ),
              
              //button to Pay
               MyButton(
                onTap: () =>Navigator.push(
                  context,MaterialPageRoute(builder: (context)=>const PaymentPage(),
                ),
                ),
                  text: "Proceed to Checkout"),
              const SizedBox(height: 25),
            ],
          ),
        );
      },
    );
  }
}
