import 'package:flutter/material.dart';
import 'package:prak8/screens/favorites_screen.dart';
import 'package:prak8/screens/products_screen.dart';
import 'package:prak8/screens/profile_screen.dart';
import 'package:badges/badges.dart' as badges;
import 'package:prak8/screens/shop_cart_screen.dart';
import 'package:prak8/api_service.dart';
import 'package:prak8/models/items.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    widgetOptions = [
      ItemsPage(navToShopCart: (i) => onTab(i)),
      FavoritePage(navToShopCart: (i) => onTab(i)),
      ShopCartPage(navToShopCart: (i) => onTab(i)),
      const ProfilePage()
    ];
  }
  /*
  int count = ShoppingCart.fold(0, (sum, item) => sum + item.count);

  void updateCount() {
    setState(() {
      count = ShoppingCart.fold(0, (sum, item) => sum + item.count);
    });
  }
  */

  void onTab(int i) {
    setState(() {
      selectedIndex = i;
    });
  }

  static List<Widget> widgetOptions = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[200],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Главная',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Избранное',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_rounded),
              label: 'Корзина',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Профиль',
              backgroundColor: Colors.white)
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.grey[800],
        unselectedItemColor: Colors.grey[500],
        onTap: onTab,
      ),
    );
  }
}