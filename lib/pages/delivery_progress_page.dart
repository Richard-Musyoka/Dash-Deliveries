import 'package:dashlet_deliveries/components/my_receipt.dart';
import 'package:dashlet_deliveries/models/restaurant.dart';
import 'package:dashlet_deliveries/services/database/firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {

  //get access to database
  FirestoreService db = FirestoreService();

  @override
  void initState() {
    // if we get here, submit  order to db
    super.initState();

    String receipt= context.read<Restaurant>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: const Column(
        children: [
          MyReceipt(),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context){
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        )
      ),
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration( color: Theme.of(context).colorScheme.background,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person_3_rounded),
            ),
          ),
          const SizedBox(width: 10),


          //driver details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Richard Musyoka",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Theme.of(context).colorScheme.inversePrimary,

              ),
              ),
              Text("Driver",
                style: TextStyle(

                  color: Theme.of(context).colorScheme.primary,

                ),
              ),

            ],
          ),
        const Spacer(),

        Row(
          children: [
            //message button
            Container(
              decoration: BoxDecoration( color: Theme.of(context).colorScheme.background,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.messenger_rounded),
              ),
            ),
            const SizedBox(width: 10),
            //call button
            Container(
              decoration: BoxDecoration( color: Theme.of(context).colorScheme.background,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.call),
                color: Colors.green,
              ),
            ),
          ],
        )

        ],
      ),
    );

  }
}
