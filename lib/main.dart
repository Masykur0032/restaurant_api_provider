import 'package:flutter/material.dart';
import 'package:resto_sub2/common/styles.dart';
import 'package:resto_sub2/data/model/restaurant.dart';
import 'package:resto_sub2/data/model/restaurant_search.dart';
import 'package:resto_sub2/ui/home_page.dart';
import 'package:resto_sub2/ui/resto_detail_page.dart';
import 'package:resto_sub2/ui/resto_search_page.dart';
import 'package:resto_sub2/ui/search_resto_detail_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Resto App',
      theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: secondaryColor,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: myTextTheme,
        appBarTheme: AppBarTheme(
          textTheme: myTextTheme.apply(bodyColor: Colors.black),
          elevation: 0,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: secondaryColor,
          unselectedItemColor: Colors.grey,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: secondaryColor,
            textStyle: TextStyle(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              ),
            ),
          ),
        ),
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as Restaurant,
            ),
        RestaurantSearchPage.routeName: (context) => RestaurantSearchPage(
              nameRestaurant:
                  ModalRoute.of(context)?.settings.arguments as String,
            ),
        RestaurantDetailPageSearch.routeName: (context) =>
            RestaurantDetailPageSearch(
              restaurant: ModalRoute.of(context)?.settings.arguments
                  as RestaurantSearch,
            ),
      },
    );
  }
}
