import 'package:dashlet_deliveries/components/my_drawer_tile.dart';
import 'package:flutter/material.dart';
import 'package:dashlet_deliveries/services/auth/auth_service.dart';


import '../pages/settings_page.dart';
import 'my_drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final authService = AuthService();
      authService.signOut();
    }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //app logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.fastfood_rounded,
              size: 80,
              color:Theme.of(context).colorScheme.inversePrimary ,
            ),

          ),
          Padding(padding: const EdgeInsets.all(25.0),
          child: Divider(
            color: Theme.of(context).colorScheme.secondary ,
          ),
          ),

          //home tile
          MyDrawerTile(
            text: "H O M E",
            icon: Icons.home,
            onTap: () => Navigator.pop(context)
          ),

          //settings tile
          MyDrawerTile(
            text: "S E T T I N G S",
            icon: Icons.settings,
            onTap: (){
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage(),
                 ),
              );

            },
          ),

          const Spacer(),

          //logout tile
          MyDrawerTile(
            text: "L O G O U T",
            icon: Icons.logout,
            onTap: (){
              logout();
              Navigator.pop(context);
            },
          ),

          const SizedBox(height: 25,),

        ],
      ),
    );
  }
}
