import 'package:flutter/material.dart';
import 'package:recipies/model/recipe.dart';
import 'package:recipies/services/api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<Recipe> recipes = [];
  @override
  void initState() {
    super.initState();
    getRecipies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(recipes[index].name),
              subtitle: Text(recipes[index].cuisine),
              leading: Image.network(recipes[index].image),
            ),
          );
        },
      ),
    );
  }

  Future<void> getRecipies() async {
    recipes = await Api().getRecipes();
    setState(() {});
  }
}
