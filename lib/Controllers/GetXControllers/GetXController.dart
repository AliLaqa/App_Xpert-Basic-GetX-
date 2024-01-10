import 'package:get/get.dart';

class AppController extends GetxController {
  ///GetX Variables
  ///GetX Variables are declared different that normal dart variables, as shown below
  //Before mentioning the GetX variable data type we need to use RX and the data type name should start with capital letter.
  //After declaring a GetX variable we use .obs,
  // .obs means observe, it will change the variable value where ever it's used in the app.
  RxInt age = 24.obs;
  RxBool isMale = true.obs;
  RxString name = "Ali".obs;
  RxDouble height = 5.8.obs;
  RxBool darkNight = false.obs;

  ///Rules
  ///GetX variables can only be declared inside GetX controller

///Increment and decrement function for age variable
///I've moved these below functions in HomeScreen.dart which are working fine and are usable.
//   void increase() {
//     age++;
//     print(age);
//   }
//
//   void decrease() {
//     age--;
//     print(age);
//   }
}
