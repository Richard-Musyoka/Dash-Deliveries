import 'package:dashlet_deliveries/components/my_button.dart';
import 'package:dashlet_deliveries/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';

class FoodPage extends StatefulWidget {

  final Food food;
   final Map<Addon,bool> selectedAddons={};


   FoodPage({super.key, required this.food})

  {

  //intiatlize selected Addons to false
  for

  (

  Addon addon in food.availableAddons){
  selectedAddons[addon] = false;
  }
}

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

//method to add to cart
  void addToCart(Food food,Map<Addon ,bool>selectedAddons){
  //close the current page
  Navigator.pop(context);
  //format the select Addons
    List<Addon> currentlySelectedAddon =[];
    for (Addon addon in widget.food.availableAddons){
      if(widget.selectedAddons[addon]==true){
        currentlySelectedAddon.add(addon);
      }
    }
    //add to cart
    context.read<Restaurant>().addToCart(food, currentlySelectedAddon);

  }
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
                  //Scafold
                  Scaffold(
              body: SingleChildScrollView(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              //food image
              Image.asset(widget.food.imagePath),
              Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(children: [
              //food name
              Text(widget.food.name,
              style:  TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Theme.of(context).colorScheme.primary,

              ),
              ),
              const SizedBox(height: 10),

              //food price
              Text('\$${widget.food.price}',
              style:  TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Theme.of(context).colorScheme.primary,

              ),
              ),
              const SizedBox(height: 10),


              //food description
              Text(widget.food.description),
              Divider(
              color: Theme.of(context).colorScheme.secondary,

              ),
              //food addons
              const SizedBox(height: 10),
              Text("Add ons",
              style:  TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Theme.of(context).colorScheme.primary,

              ),


              ),
              const SizedBox(height: 10),
              Container(
              decoration: BoxDecoration(
              border: Border.all(
              color: Theme.of(context).colorScheme.secondary,


              ),
              borderRadius: BorderRadius.circular(20),
              ),
              child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: widget.food.availableAddons.length,
              itemBuilder: (context,index){
              Addon addon = widget.food.availableAddons[index];
              return CheckboxListTile(
              title: Text(addon.name),
              subtitle: Text('\$${addon.price}',
              style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              ),
              ),
              value: widget.selectedAddons[addon],
              onChanged: (bool ? value){
              setState(() {
              widget.selectedAddons[addon]=value!;
              });
              },
              );
              }),
              ),

              ],
              ),
              ),


              // buttons add to cart
              MyButton(text: "Add to Cart",
              onTap: () => addToCart(widget.food ,widget.selectedAddons),
              ),
              const SizedBox(height: 25),
              ],
              ),
              )
              ),
        //Scaffold
        //back Button
        SafeArea(child: Opacity(
          opacity: 0.6,
          child: Container(
            margin: const EdgeInsets.only(left:25),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              onPressed: ()=>Navigator.pop(context),
    ),
            ),
          ),
        ),

      ]
    );
  }
}
