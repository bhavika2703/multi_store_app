import 'package:flutter/material.dart';
import 'package:multi_store_app/category.dart';
import 'package:multi_store_app/main_screen/home.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({Key? key}) : super(key: key);

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
   int _selectedIndex = 0;
     final List<Widget> _tabs = [
      const HomeScreen(),
      const CategoryScreen(),
      const Center(child: Text('stores screen'),),
      const Center(child: Text('cart screen'),),
      const Center(child: Text('profile screen'),),
    ];

  void _onItemTapped(int index) {
     setState(() {
       _selectedIndex =index;
                });
  }
  
  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      body: _tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
         type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        currentIndex: _selectedIndex,
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Stores'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
           _onItemTapped(index);
          
        },
       
      ),
    );
  }

  
}
