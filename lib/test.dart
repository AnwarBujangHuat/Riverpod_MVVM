 // ignore_for_file: avoid_print

 import 'package:mobile_flutter_template/app/app.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
   const Test({Key? key}) : super(key: key);

   void updateAppState(){
     MyApp.instance.appState =10;
   }
   void getAppState(){
     print( MyApp.instance.appState); // 10
   }

   @override
   Widget build(BuildContext context) {
     return Container();
   }
 }
