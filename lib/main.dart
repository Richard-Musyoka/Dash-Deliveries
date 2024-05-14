import 'package:dashlet_deliveries/services/auth/auth_gate.dart';
import 'package:dashlet_deliveries/firebase_options.dart';
import 'package:dashlet_deliveries/models/restaurant.dart';
import 'package:dashlet_deliveries/themes/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(providers: [
      //theme provider
      ChangeNotifierProvider(create: (context)=>ThemeProvider()),

        //restaurant provider
      ChangeNotifierProvider(create: (context)=>Restaurant()),

    ],
        child: const MyApp(),
    ),

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
