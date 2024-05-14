import 'package:dashlet_deliveries/pages/login_page.dart';
import 'package:dashlet_deliveries/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //set login page as default
  bool showloginPage= true;

  //toggle between the two pages
  void togglePages(){
    setState(() {
      showloginPage=!showloginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
   if(showloginPage){
     return LoginPage(onTap: togglePages);
   }else{
     return RegisterPage(onTap: togglePages);
   }
  }
}
