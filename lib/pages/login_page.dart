import 'package:dashlet_deliveries/components/my_button.dart';
import 'package:dashlet_deliveries/components/my_textfield.dart';
import 'package:dashlet_deliveries/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController emailController= TextEditingController();
  final TextEditingController passwordController= TextEditingController();

  //login
  void login() async{
   //fill out authentication here
    //get Instance of auth service
    final _authService = AuthService();

    //try signin
    try{
       await _authService.signInWithEmailPassword(emailController.text, passwordController.text);
    }
    //catch any errors
    catch(e){
      showDialog(context: context, builder: (context)=>AlertDialog(title: Text(e.toString()),
      ),
      );
    }

  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          Icon(
            Icons.lock_open_rounded,
            size: 100,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
           SizedBox(height: 25),

          //message
          Text(
              "Food Delivery App",
          style:TextStyle(
            fontSize:16,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          ),
          const SizedBox(height: 25),


          //email text field
          MyTextField(controller: emailController ,
              hintText: "Email",
              obscureText: false),

          const SizedBox(height: 25),

          //password text field
          MyTextField(controller: passwordController ,
              hintText: "Password",
              obscureText: true),

          const SizedBox(height: 25),
          //Sign In ButtonBar

          MyButton(text: "Sign In",
          onTap: login,
          ),
          const SizedBox(height: 25),

          //register
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Not a Member?",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: widget.onTap,
                child: Text(
                  "Register",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),


        ],
      ),
    );
  }
}
