import 'package:dashlet_deliveries/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';


class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  //authenticate
  void register() async{
    //get auth service
    final _authService = AuthService();

    //check if passwords match->create user
    if(passwordController.text== confirmPasswordController.text){
      //try creating the user
      try{
        await _authService.signUpWithEmailPassword(emailController.text,passwordController.text);
      }
      //catch any errors
      catch(e){
        showDialog(context: context, builder: (context)=>AlertDialog(title: Text(e.toString()),
        ),
        );
      }

    }else{
      showDialog(context: context, builder: (context)=>AlertDialog(title: Text("Passwords dont match"),
      ),
      );
    }
    //if passwords dont match, show error
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          Icon(
            Icons.lock_open_rounded,
            size: 100,
            color: Theme
                .of(context)
                .colorScheme
                .inversePrimary,
          ),
          SizedBox(height: 25),

          //message
          Text(
            "Create an Account",
            style: TextStyle(
              fontSize: 16,
              color: Theme
                  .of(context)
                  .colorScheme
                  .inversePrimary,
            ),
          ),
          const SizedBox(height: 25),


          //email text field
          MyTextField(controller: emailController,
              hintText: "Email",
              obscureText: false),

          const SizedBox(height: 25),

          //password text field
          MyTextField(controller: passwordController,
              hintText: "Password",
              obscureText: true),

          const SizedBox(height: 25),

          //password text field
          MyTextField(controller: confirmPasswordController,
              hintText: "Confirm Password",
              obscureText: true),

          const SizedBox(height: 25),
          //Sign Up ButtonBar

          MyButton(text: "Sign Up",
            onTap: () {
              register();
            },
          ),
          const SizedBox(height: 25),

          //register
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an Account?",
                style: TextStyle(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .inversePrimary,
                ),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: widget.onTap,
                child: Text(
                  "Login here",
                  style: TextStyle(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .inversePrimary,
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
