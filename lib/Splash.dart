import 'package:flutter/material.dart';
import 'package:weather_app/pages/home/home_screen.dart';
import 'dart:async';

class Splash extends StatefulWidget {
  const Splash({super.key});

    @override
  State<StatefulWidget> createState()=> _Splash();
}
class _Splash extends  State<StatefulWidget> {

   @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(seconds: 6), () {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) =>HomeScreen()),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 30,
        shadowColor: Colors.blueAccent,
       title:  Text(
  "Weather App",
  textAlign: TextAlign.center, // Center the text
  style: TextStyle(
    fontSize: 25,
    fontFamily: 'RobotoMono',
    color: Colors.white,
    shadows: [
      Shadow(
        color: const Color.fromARGB(255, 12, 120, 209),
        offset: Offset(2, 2), // Adjust the shadow position if needed
        blurRadius: 3.0, // Optional: Adds a blur effect to the shadow
      ),
    ],
    fontWeight: FontWeight.bold,
  ),
),

   centerTitle: true,           
      ),
      body: Center(
   child:
          Positioned.fill(
            child: Image.asset(
  "assets/images/cloud-in-blue-sky.jpg",
              width: double.infinity,
              height:double.infinity,
              fit:BoxFit.cover,
            ),
          ),
      ),
      
  
      
    );
  }
}
