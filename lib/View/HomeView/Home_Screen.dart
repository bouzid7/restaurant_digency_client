// ignore_for_file: non_constant_identifier_names, must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:restaurant_digency_client/Controler/Area_Data.dart';
import 'package:restaurant_digency_client/Controler/Categorie_Data.dart';
import 'package:restaurant_digency_client/Controler/Ingredient_Data.dart';
import 'package:restaurant_digency_client/View/HomeView/HomeBox/Ads_Box.dart';
import 'package:restaurant_digency_client/View/HomeView/HomeBox/Categorie_Box.dart';
import 'package:restaurant_digency_client/View/HomeView/HomeBox/CroupPhoto_Box.dart';
import 'package:restaurant_digency_client/View/HomeView/HomeBox/Food_Box.dart';
import 'package:restaurant_digency_client/View/HomeView/HomeBox/Header_Box.dart';
import 'package:restaurant_digency_client/View/HomeView/HomeBox/Item_Box.dart';
import 'package:restaurant_digency_client/View/HomeView/HomeBox/MostWatched_Box.dart';
import 'package:restaurant_digency_client/View/HomeView/HomeBox/Search_Box.dart';
import 'package:restaurant_digency_client/View/Categorie_Screen.dart';
import 'package:restaurant_digency_client/View/SeeAllMeal_Screen.dart';
import '../../Controler/Meal_Data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //MealData.printMealByID('52770');
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          const HeaderBox(), // widget  header of the home  screen
          // const SearchBox(),
          // const SizedBox(height: 10),
          AdsBox(revere: false), //   widget adsence box  of home screen
          ItemsBox(
            // widget items of the home screen
            bkg: Colors.black,
            futureList: IngredientData.GetIngredientTitle(),
            filterType: 'Ingredient',
          ),
          CategorieBox(
            // widget of categories screen
            BoxTitle: 'Categories',
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const CategorieScreen()));
            },
          ),
          FoodBox(
              FirstChar: 'c', // widget of Popular Meals
              BoxTitle: 'Popular Meals',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SeeAllMeals(
                              ScreenTitle: 'Popular Meals',
                              firstChar: 'c',
                            )));
              }),

          FoodBox(
              FirstChar: 'm', // widgte of Recent  Search
              BoxTitle: 'Recent Search',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SeeAllMeals(
                              ScreenTitle: 'Recent Search',
                              firstChar: 'm',
                            )));
              }),
          GroupPhotoBox(
            BoxTitle: 'Our Teams', // Widget of Teams
            onPressed: () {
              print('Go To Photo Screen');
            },
          ),
          ItemsBox(
            bkg: Colors.black,
            futureList: AreaData.GetArea(),
            filterType: 'Area', // Widget of Contry Meals
          ),
          FoodBox(
              FirstChar: 'l', // Widget of Top Reviews
              BoxTitle: 'Top Reviews',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SeeAllMeals(
                              ScreenTitle: 'Top Reviews',
                              firstChar: 'l',
                            )));
              }),
          FoodBox(
              FirstChar: 'b', // Widget of Top Search
              BoxTitle: 'Top Search',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SeeAllMeals(
                              ScreenTitle: 'Top Search',
                              firstChar: 'b',
                            )));
              }),
          ItemsBox(
            // Widgte of Categories
            bkg: const Color(0xffC3211A),
            futureList: CategorieData.GetCategorieTitle(),
            filterType: 'Categorie',
          ),

          AdsBox(
              revere:
                  false), // repeate adsence box in the queue of the application

          //const MostWatchedBox(FirstChar: 'k'),//  Widget of Most Watched
        ],
      ),
    );
  }
}
