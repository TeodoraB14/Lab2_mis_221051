import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/category.dart';
import '../models/meal.dart';
import '../models/meal_details.dart';

class ApiService {
  static const String base = "https://www.themealdb.com/api/json/v1/1";

  static Future<List<Category>> getCategories() async {
    final url = Uri.parse("$base/categories.php");
    final res = await http.get(url);
    final data = jsonDecode(res.body);
    return (data["categories"] as List)
        .map((e) => Category.fromJson(e))
        .toList();
  }

  static Future<List<Meal>> getMeals(String category) async {
    final url = Uri.parse("$base/filter.php?c=$category");
    final res = await http.get(url);
    final data = jsonDecode(res.body);
    return (data["meals"] as List).map((e) => Meal.fromJson(e)).toList();
  }

  static Future<List<Meal>> searchMeals(String query) async {
    final url = Uri.parse("$base/search.php?s=$query");
    final res = await http.get(url);
    final data = jsonDecode(res.body);
    if (data["meals"] == null) return [];
    return (data["meals"] as List).map((e) => Meal.fromJson(e)).toList();
  }

  static Future<MealDetail> getMealDetail(String id) async {
    final url = Uri.parse("$base/lookup.php?i=$id");
    final res = await http.get(url);
    final data = jsonDecode(res.body);
    return MealDetail.fromJson(data["meals"][0]);
  }

  static Future<MealDetail> getRandomMeal() async {
    final url = Uri.parse("$base/random.php");
    final res = await http.get(url);
    final data = jsonDecode(res.body);
    return MealDetail.fromJson(data["meals"][0]);
  }
}
