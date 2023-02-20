import 'package:animal_biography/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {

  logicIntro() async {
    final prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    logicIntro();
    Future.delayed(
      const Duration(seconds: 3),
          () => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const home_page())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
         Container(
             height: 900,
             width: 900,
             child: Image.asset("assets/images/dashboard_10.jpg",fit: BoxFit.cover,)),

          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(
                  height: 600,
                ),
                Text("     Welcome to the",style: TextStyle(fontSize: 35,color: Colors.black,fontWeight: FontWeight.w500),),
                SizedBox(
                  height: 10,
                ),
                Text("    Wildlife",style: TextStyle(fontWeight:FontWeight.w800,color: Colors.black,fontSize: 55),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
