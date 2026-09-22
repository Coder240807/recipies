import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recipies/model/recipe.dart';

class Api {
  Future<List<Recipe>> getRecipes() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/recipes'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List list = data['recipes'];
      return list.map((item) => Recipe.fromJson(item)).toList();
    }
    throw Exception('Error');
  }
}
