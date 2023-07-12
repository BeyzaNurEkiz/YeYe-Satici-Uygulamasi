import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yeyeapp_flutter/authentication/auth_screen.dart';
import 'package:yeyeapp_flutter/global/global.dart';
import 'package:yeyeapp_flutter/mainScreens/home_screen.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen>
{

  startTimer()
  {

    Timer(const Duration(seconds: 2), () async
    {
      //satıcı önceden giriş yaptıysa anasayfaya yönlendirir.
      if(firebaseAuth.currentUser != null)
      {
        Navigator.push(context, MaterialPageRoute(builder: (c)=> const HomeScreen()));
      }
      else
      {
        Navigator.push(context, MaterialPageRoute(builder: (c)=> const AuthScreen()));
      }
    });
  }

  @override
  void initState() {
    super.initState();

    startTimer();

  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/yeyee.png"),

              const SizedBox(height: 10,),

              const Padding(
                padding: EdgeInsets.all(8.0),


              ),
            ],
          ),
        ),
      ),
    );
  }
}
