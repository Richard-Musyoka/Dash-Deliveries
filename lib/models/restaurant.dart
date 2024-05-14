import 'package:flutter/cupertino.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'cart_item.dart';
import 'food.dart';

class Restaurant extends ChangeNotifier {
  //list of food menu
  final List<Food> _menu=[
    //burgers
    Food(
        name: "Classic Cheeseburger",
        description: "A juicy beef patty melted cheddar,lettuce,tomato and pickle.",
        imagePath: "lib/images/burgers/aloha.png",
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.33)
        ]),
    Food(
        name: "Beef Cheeseburger",
        description: "A juicy beef patty melted cheddar,lettuce,tomato and pickle.",
        imagePath: "lib/images/burgers/beef.png",
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.33)
        ]),
    Food(
        name: "Crispy Cheeseburger",
        description: "A juicy beef patty melted cheddar,lettuce,tomato and pickle.",
        imagePath: "lib/images/burgers/crispy.png",
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.33)
        ]),
    Food(
        name: "Lamb Cheeseburger",
        description: "A juicy beef patty melted cheddar,lettuce,tomato and pickle.",
        imagePath: "lib/images/burgers/lamb.png",
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.33)
        ]),
    Food(
        name: "Vegetable Cheeseburger",
        description: "A juicy beef patty melted cheddar,lettuce,tomato and pickle.",
        imagePath: "lib/images/burgers/veggie.png",
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.33)
        ]),

    //salads
    Food(
        name: "Chopped Salad",
        description: "A well made beef patty melted cheddar,lettuce,tomato and pickle.",
        imagePath: "lib/images/salads/chopped.png",
        price: 0.99,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.33)
        ]),
    Food(
        name: "Green Salad",
        description: "A well made vegetable patty melted cheddar,lettuce,tomato and pickle.",
        imagePath: "lib/images/salads/green-salad.png",
        price: 0.99,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.33)
        ]),
    Food(
        name: "Italian Salad",
        description: "A well made vegetable patty melted cheddar,lettuce,tomato and pickle.",
        imagePath: "lib/images/salads/italian.png",
        price: 0.99,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.33)
        ]),
    Food(
        name: "Spring Salad",
        description: "A well made vegetable patty melted cheddar,lettuce,tomato and pickle.",
        imagePath: "lib/images/salads/spring.png",
        price: 0.99,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.33)
        ]),
    Food(
        name: "Vegetarian Salad",
        description: "A well made vegetable patty melted cheddar,lettuce,tomato and pickle.",
        imagePath: "lib/images/salads/vegetarian.png",
        price: 0.99,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.33)
        ]),

    //sides
    Food(
        name: "French Fries",
        description: "A well made vegetable patty melted cheddar,lettuce,tomato and pickle.",
        imagePath: "lib/images/sides/fries.png",
        price: 0.99,
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.33)
        ]),
    Food(
        name: "Macaronni ",
        description: "A well made vegetable patty melted cheddar,lettuce,tomato and pickle.",
        imagePath: "lib/images/sides/macaronni.png",
        price: 0.99,
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.33)
        ]),
    Food(
        name: "Mozarella ",
        description: "A well made vegetable patty melted cheddar,lettuce,tomato and pickle.",
        imagePath: "lib/images/sides/mozarella.png",
        price: 0.99,
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.33)
        ]),
    Food(
        name: " Fried Potato ",
        description: "A well made vegetable patty melted cheddar,lettuce,tomato and pickle.",
        imagePath: "lib/images/sides/potato.png",
        price: 0.99,
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.33)
        ]),
    Food(
        name: " Smoky",
        description: "A well made vegetable patty melted cheddar,lettuce,tomato and pickle.",
        imagePath: "lib/images/sides/smoky.png",
        price: 0.99,
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.33)
        ]),

    //desserts
    Food(
        name: "Dessert One",
        description: "A well made vegetable patty melted cheddar,lettuce,tomato and pickle.",
        imagePath: "lib/images/desserts/dessert1.png",
        price: 0.99,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.33)
        ]),
    Food(
        name: "Dessert Two",
        description: "A well made vegetable patty melted cheddar,lettuce,tomato and pickle.",
        imagePath: "lib/images/desserts/dessert2.png",
        price: 0.99,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.33)
        ]),
    Food(
        name: "Dessert Three",
        description: "A well made vegetable patty melted cheddar,lettuce,tomato and pickle.",
        imagePath: "lib/images/desserts/dessert3.png",
        price: 0.99,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.33)
        ]),
    Food(
        name: "Dessert Four",
        description: "A well made vegetable patty melted cheddar,lettuce,tomato and pickle.",
        imagePath: "lib/images/desserts/dessert4.png",
        price: 0.99,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.33)
        ]),
    Food(
        name: "Dessert Five",
        description: "A well made vegetable patty melted cheddar,lettuce,tomato and pickle.",
        imagePath: "lib/images/desserts/dessert5.png",
        price: 0.99,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.33)
        ]),

    //drinks
    Food(
        name: "Cocktails",
        description: "A well made vegetable patty melted cheddar,lettuce,tomato and pickle.",
        imagePath: "lib/images/drinks/cocktails.png",
        price: 0.99,
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.33)
        ]),
    Food(
        name: "Mojito",
        description: "A well made vegetable patty melted cheddar,lettuce,tomato and pickle.",
        imagePath: "lib/images/drinks/mojito.png",
        price: 0.99,
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.33)
        ]),
    Food(
        name: "Smoothy",
        description: "A well made vegetable patty melted cheddar,lettuce,tomato and pickle.",
        imagePath: "lib/images/drinks/smoothy.png",
        price: 0.99,
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.33)
        ]),
    Food(
        name: "Whisky",
        description: "A well made vegetable patty melted cheddar,lettuce,tomato and pickle.",
        imagePath: "lib/images/drinks/whisky.png",
        price: 0.99,
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.33)
        ]),
    Food(
        name: "Wine",
        description: "A well made vegetable patty melted cheddar,lettuce,tomato and pickle.",
        imagePath: "lib/images/drinks/wine.png",
        price: 0.99,
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.33)
        ]),

  ];
  // Getters
  //delivery address which user can change or update
  String _deliveryAddress = "1000 Kangundo Road";

  //list of food menu
List<Food> get menu => _menu;

//user cart
  List<CartItem> get cart => _cart;
  String get deliveryAddress =>_deliveryAddress;


/*
Operations

 */
//add to cart
final List<CartItem> _cart=[];

void addToCart(Food food,List<Addon> selectedAddons){
  CartItem? cartItem = _cart.firstWhereOrNull((item){
    //check if the food items are same
    bool isSameFood=item.food==food;
    //check if the list of selected foods are the same
    bool isSameAddons= const ListEquality().equals(item.selectedAddons,selectedAddons);
    return isSameFood && isSameAddons;
  });

  //if cart already exists,increase its quantity

  if(cartItem!=null){
    cartItem.quantity++;
  }else{
    //add a new cart
    _cart.add(CartItem(
        food: food,
        selectedAddons: selectedAddons
        ),
    );
  }
  notifyListeners();
}

//remove from cart

void removeFromCart( CartItem cartItem){
  int cartIndex= _cart.indexOf(cartItem);
  if(cartIndex!=1){
    if(_cart[cartIndex].quantity>1){
      _cart[cartIndex].quantity--;
    }else{
      _cart.removeAt(cartIndex);
    }
  }
  notifyListeners();
}

//get total price
double getTotalPrice(){
  double total=0;
  for(CartItem cartItem in _cart){
    double itemTotal = cartItem.food.price;

    for(Addon addon in cartItem.selectedAddons){
      itemTotal+=addon.price;
    }
  }
  return total;
}

//get total number of items in the cart
 int getTotalItemCount(){
  int totalItemCount=0;
  for(CartItem cartItem in _cart){
    totalItemCount += cartItem.quantity;
  }
  return totalItemCount;
  }

//clear cart
void clearCart(){
  _cart.clear();
  notifyListeners();
}

//update Delivery Address
  void updateDeliveryAddress(String newAddress){
  _deliveryAddress= newAddress;
  notifyListeners();
  }


/*
Helpers
 */
//generate a receipt
String displayCartReceipt(){
  final receipt= StringBuffer();
  receipt.writeln("Here is your receipt");
  receipt.writeln();

  //format date to include seconds too
  String formattedDate= DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

  receipt.writeln(formattedDate);
  receipt.writeln();
  receipt.writeln("-------------------------------------------------------");


  for(final cartItem in _cart){
    receipt.writeln(
      "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}"
    );
    if(cartItem.selectedAddons.isNotEmpty){
      receipt.writeln(
        " Add-ons: ${_formatAddons(cartItem.selectedAddons)}"
      );

    }
    receipt.writeln();
  }
  receipt.writeln("---------------------------------------------------");
  receipt.writeln();
  receipt.writeln("Total Items : ${getTotalItemCount()}");
  receipt.writeln("Total Price : ${_formatPrice(getTotalPrice())}");
  receipt.writeln();
  receipt.writeln("Delivering To : $deliveryAddress");
  return receipt.toString();
}
//format double value into money
String _formatPrice(double price){
  return "\$${price.toStringAsFixed(2)}";
}

//format list of addons to a string summary

String _formatAddons(List<Addon> addons){
  return addons.map((addon) => "${addon.name}(${_formatPrice(addon.price)})")
      .join(", ");
}
}

