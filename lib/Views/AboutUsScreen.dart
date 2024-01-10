import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_getx/Views/HomeScreen.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.lightGreen.withOpacity(.6), Colors.amberAccent.shade700.withOpacity(.7)]),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20)
          )
          ),
          child: Column(
            children: [
              Spacer(),
              Text(
                "About Us",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),textAlign: TextAlign.end,
              ),
            ],
          ),
        ),
      ),
      ///BODY START-->
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: (){
                //use .to for navigation push
                Get.to(() => HomeScreen());
                //use offAll for navigator push replacement which is used on SplashScreen
              },
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                    color: Colors.black,
                  ),
                  width: 90,
                  child: Row(
                    children: [
                      Text(" Home ",style: TextStyle(color: Colors.white, fontSize: 20),),
                      Icon(Icons.home, color: Colors.amberAccent.shade700,size: 20,)
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}



























