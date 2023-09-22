import 'package:flutter/material.dart';
import 'package:multi_store_app/main_screen/customar_home.dart';
import 'package:multi_store_app/main_screen/supplier_home.dart';
import 'package:multi_store_app/main_screen/welcom_screen.dart';
void main(){
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner:false,
      home: const WelcomeScreen(),
      initialRoute: '/welcome_screen',
      routes: {
        '/welcome_screen':((context) => const WelcomeScreen()),
        '/customer_home':((context) => const CustomerHomeScreen()),
        '/supplier_home':((context) => const SupplierHomeScreen()),
      },
     
    );
  }
}