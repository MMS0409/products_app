import 'package:bottom_navigators/ui/favorite.dart';
import 'package:bottom_navigators/ui/products.dart';
import 'package:bottom_navigators/ui/shop.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex = 0;

  List<Widget> screens = [];

  @override
  void initState() {
    screens.add(const ProductsScreen());
    screens.add(const ShopScreen());
    screens.add(const FavoriteScreen());
    screens.add(const LoginScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: screens[currentTabIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentTabIndex,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          onTap: (index){
            setState(() {
              currentTabIndex = index;
            });
          },
          backgroundColor: Colors.indigo,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home,),label: "",),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.favorite),label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: ""),
          ],
        ),
      ),
    );
  }
}