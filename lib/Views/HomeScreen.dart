import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_getx/Controllers/GetXControllers/GetXController.dart';
import 'package:learning_getx/Views/AboutUsScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ///GetX Dependency Injection/Instance
    ///Making instance of GetX AppController o use it's variables
    ///We need to make instance of GetX controller before using variables inside it.
    AppController appController = Get.put(AppController());
    
    ///To increase age
      void increase(){
        appController.age++;
        print(appController.age);
      }
    ///To decrease age
      void decrease(){
        appController.age--;
        print(appController.age);
      }
    
    void ThemeChange(){
        if(appController.darkNight == false){
          Get.changeTheme(ThemeData.dark());
          appController.darkNight = true.obs;
          print(appController.darkNight);

        }else if (appController.darkNight == true){
          Get.changeTheme(ThemeData.light());
          appController.darkNight = false.obs;
          print(appController.darkNight);
        }

    }  

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber.shade700.withOpacity(.5),
        flexibleSpace: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.lightGreen.withOpacity(.6), Colors.amberAccent.shade700.withOpacity(.7)]),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),)
          ),
          child: Column(
            children: [
              Spacer(),
              Text(
                "HomeScreen",
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg_home.jpg"),
              fit: BoxFit.fill,
              opacity: 0.8,
              repeat: ImageRepeat.noRepeat,
              alignment: Alignment.center),
        ),
        ///Column Start-->
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ///SnackBar Button
            ElevatedButton(
              onPressed: () {
                //Showing Snackbar with GetX
                Get.snackbar(
                  "Download Awesomeness",
                  "Your Awesomeness Downloaded",
                  isDismissible: true,
                  dismissDirection: DismissDirection.horizontal,
                  duration: Duration(seconds: 5),
                  snackPosition: SnackPosition.TOP,
                  icon: Icon(Icons.check),
                  backgroundColor: Colors.amberAccent.shade700,
                  // mainButton: TextButton(
                  //     onPressed: (){},
                  //     child: Text("OK"))
                );
              },
              child: Text("Snack Bar"),
            ),

            ///Dialogue Box Button
            ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                    backgroundColor: Colors.black,
                    barrierDismissible: false,
                    title: "You will achieve everything",
                    titleStyle: TextStyle(color: Colors.amberAccent.shade700),
                    //content can have any widget
                    content: Row(
                      children: [
                        Text(
                          "Do you confirm?",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    confirm: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Yes!",
                          style: TextStyle(color: Colors.black),
                        )),
                  );
                },
                child: Text("Dialogue Box")),
            ///AboutUs Button-->
            ElevatedButton(
              onPressed: (){
                Get.to(() => AboutUsScreen());
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("About Us ", style: TextStyle(color: Colors.black),),
                  Icon(Icons.search, color: Colors.amberAccent.shade700,)
                ],
              ),),

            ///GetX Dart Theme change Button
            ElevatedButton(
                onPressed: (){
                  ThemeChange();
                },
                child: Text("Change ThemeMode")),


            ///GetX Controller variables use
            Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              child: Column(
                children: [
                  SizedBox(height: 5,),
                  /// Add Icon Button for GetX Variables-->
                  IconButton(
                      onPressed: (){
                       increase(); 
                      },
                      icon: Icon(Icons.add, size: 40,color: Colors.amberAccent,)),

                  ///Applying State management in a stateless widget. just wrap the widget with Obx widget which you want to make stateful,
                  ///below we are using the instance of GetX AppController we made above to access the values inside the controller.
                  /// Age Text
                  Obx(() => Text(appController.age.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),),

                  /// Subtract Icon Button for GetX Variables-->
                  IconButton(
                      onPressed: (){
                        decrease();
                      },
                      icon: Icon(Icons.minimize_rounded, size: 40,color: Colors.deepOrange,)),
                  SizedBox(height: 10,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


///Perfect working GetX code covering everythin in the youtube crash course video mentioned in main.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:learning_getx/Controllers/GetXControllers/GetXController.dart';
// import 'package:learning_getx/Views/AboutUsScreen.dart';
//
// class HomeScreen extends StatelessWidget {
//    const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     ///GetX Dependency Injection/Instance
//     ///Making instance of GetX AppController o use it's variables
//       ///We need to make instance of GetX controller before using variables inside it.
//     AppController appController = Get.put(AppController());
//
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.amber.shade700.withOpacity(.5),
//         flexibleSpace: Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           decoration: BoxDecoration(
//               gradient: LinearGradient(
//                   colors: [Colors.lightGreen.withOpacity(.6), Colors.amberAccent.shade700.withOpacity(.7)]),
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(20),
//             bottomRight: Radius.circular(20),)
//           ),
//           child: Column(
//             children: [
//               Spacer(),
//               Text(
//                 "HomeScreen",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     fontStyle: FontStyle.italic,
//                 ),textAlign: TextAlign.end,
//               ),
//             ],
//           ),
//         ),
//       ),
//       ///BODY START-->
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage("assets/images/bg_home.jpg"),
//               fit: BoxFit.fill,
//               opacity: 0.8,
//               repeat: ImageRepeat.noRepeat,
//               alignment: Alignment.center),
//         ),
//         ///Column Start-->
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             ///SnackBar Button
//             ElevatedButton(
//               onPressed: () {
//                 //Showing Snackbar with GetX
//                 Get.snackbar(
//                   "Download Awesomeness",
//                   "Your Awesomeness Downloaded",
//                   isDismissible: true,
//                   dismissDirection: DismissDirection.horizontal,
//                   duration: Duration(seconds: 5),
//                   snackPosition: SnackPosition.TOP,
//                   icon: Icon(Icons.check),
//                   backgroundColor: Colors.amberAccent.shade700,
//                   // mainButton: TextButton(
//                   //     onPressed: (){},
//                   //     child: Text("OK"))
//                 );
//               },
//               child: Text("Snack Bar"),
//             ),
//
//             ///Dialogue Box Button
//             ElevatedButton(
//                 onPressed: () {
//                   Get.defaultDialog(
//                     backgroundColor: Colors.black,
//                     barrierDismissible: false,
//                     title: "You will achieve everything",
//                     titleStyle: TextStyle(color: Colors.amberAccent.shade700),
//                     //content can have any widget
//                     content: Row(
//                       children: [
//                         Text(
//                           "Do you confirm?",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ],
//                     ),
//                     confirm: ElevatedButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: Text(
//                           "Yes!",
//                           style: TextStyle(color: Colors.black),
//                         )),
//                   );
//                 },
//                 child: Text("Dialogue Box")),
//             ///AboutUs Button-->
//             ElevatedButton(
//                 onPressed: (){
//                   Get.to(AboutUsScreen());
//                 },
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text("About Us ", style: TextStyle(color: Colors.black),),
//                     Icon(Icons.search, color: Colors.amberAccent.shade700,)
//                   ],
//                 ),),
//
//             ///GetX Dart Theme change Button
//             // ElevatedButton(
//             //     onPressed: (){
//             //     Applytheme();
//             //     },
//             //     child: Text("Change ThemeMode")),
//
//
//             ///GetX Controller variables use
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.black,
//                 borderRadius: BorderRadius.all(Radius.circular(5))
//               ),
//               child: Column(
//                 children: [
//                   SizedBox(height: 5,),
//                   /// Add Icon Button for GetX Variables-->
//                   IconButton(
//                       onPressed: (){
//                         appController.increase();
//                       },
//                       icon: Icon(Icons.add, size: 40,color: Colors.amberAccent,)),
//
//                   ///Applying State management in a stateless widget. just wrap the widget with Obx widget which you want to make stateful,
//                   ///below we are using the instance of GetX AppController we made above to access the values inside the controller.
//                   /// Age Text
//                   Obx(() => Text(appController.age.toString(),
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                   ),),
//
//                   /// Subtract Icon Button for GetX Variables-->
//                   IconButton(
//                       onPressed: (){
//                         appController.decrease();
//                       },
//                       icon: Icon(Icons.minimize_rounded, size: 40,color: Colors.deepOrange,)),
//                   SizedBox(height: 10,)
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

///Changing theme using GetX in Statefull widget
//import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:learning_getx/Views/AboutUsScreen.dart';
//
// class HomeScreen extends StatefulWidget {
//    const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//
//   bool darkNight = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.amber.shade700.withOpacity(.5),
//         flexibleSpace: Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           decoration: BoxDecoration(
//               gradient: LinearGradient(
//                   colors: [Colors.lightGreen.withOpacity(.6), Colors.amberAccent.shade700.withOpacity(.7)]),
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(20),
//             bottomRight: Radius.circular(20),)
//           ),
//           child: Column(
//             children: [
//               Spacer(),
//               Text(
//                 "HomeScreen",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     fontStyle: FontStyle.italic,
//                 ),textAlign: TextAlign.end,
//               ),
//             ],
//           ),
//         ),
//       ),
//       ///BODY START-->
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage("assets/images/bg_home.jpg"),
//               fit: BoxFit.fill,
//               opacity: 0.8,
//               repeat: ImageRepeat.noRepeat,
//               alignment: Alignment.center),
//         ),
//         ///Column Start-->
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             ///SnackBar Button
//             ElevatedButton(
//               onPressed: () {
//                 //Showing Snackbar with GetX
//                 Get.snackbar(
//                   "Download Awesomeness",
//                   "Your Awesomeness Downloaded",
//                   isDismissible: true,
//                   dismissDirection: DismissDirection.horizontal,
//                   duration: Duration(seconds: 5),
//                   snackPosition: SnackPosition.TOP,
//                   icon: Icon(Icons.check),
//                   backgroundColor: Colors.amberAccent.shade700,
//                   // mainButton: TextButton(
//                   //     onPressed: (){},
//                   //     child: Text("OK"))
//                 );
//               },
//               child: Text("Snack Bar"),
//             ),
//
//             ///Dialogue Box Button
//             ElevatedButton(
//                 onPressed: () {
//                   Get.defaultDialog(
//                     backgroundColor: Colors.black,
//                     barrierDismissible: false,
//                     title: "You will achieve everything",
//                     titleStyle: TextStyle(color: Colors.amberAccent.shade700),
//                     //content can have any widget
//                     content: Row(
//                       children: [
//                         Text(
//                           "Do you confirm?",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ],
//                     ),
//                     confirm: ElevatedButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: Text(
//                           "Yes!",
//                           style: TextStyle(color: Colors.black),
//                         )),
//                   );
//                 },
//                 child: Text("Dialogue Box")),
//             ///AboutUs Button-->
//             ElevatedButton(
//                 onPressed: (){
//                   Get.to(AboutUsScreen());
//                 },
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text("About Us ", style: TextStyle(color: Colors.black),),
//                     Icon(Icons.search, color: Colors.amberAccent.shade700,)
//                   ],
//                 ),),
//             ///GetX Dart Theme Button
//             ElevatedButton(
//                 onPressed: (){
//                 Applytheme();
//                 },
//                 child: Text("Go DarkNight Mode")),
//
//
//             ///GetX Controller variables use
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.black,
//                 borderRadius: BorderRadius.all(Radius.circular(5))
//               ),
//               child: Column(
//                 children: [
//                   SizedBox(height: 5,),
//                   /// Add Icon Button for GetX Variables-->
//                   IconButton(
//                       onPressed: (){
//                       Applytheme();
//                       },
//                       icon: Icon(Icons.add, size: 40,color: Colors.amberAccent,)),
//                   ///Text
//                   Text("24", style: TextStyle(color: Colors.white, fontSize: 20),),
//                   /// Subtract Icon Button for GetX Variables-->
//                   IconButton(
//                       onPressed: (){
//
//                       },
//                       icon: Icon(Icons.minimize_rounded, size: 40,color: Colors.deepOrange,)),
//                   SizedBox(height: 10,)
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//  Future Applytheme() async{
//     if(darkNight == false){
//       Get.changeTheme(ThemeData.dark());
//       darkNight = true;
//       print(darkNight);
//     } else if (darkNight == true){
//       Get.changeTheme(ThemeData.light());
//       darkNight = false;
//       print(darkNight);
//     }
//
//   }
//
// }








