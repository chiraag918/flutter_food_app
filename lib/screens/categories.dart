import 'package:flutter/material.dart';

import 'package:flutter_food_app/data/dummy_data.dart';
import 'package:flutter_food_app/screens/meals.dart';
import 'package:flutter_food_app/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void handleOnCategoryTap(context, category) {
    final filteredList = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) =>
            MealsScreen(title: category.title, meals: filteredList),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          "Food App",
        )),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            children: [
              for (final category in availableCategories)
                CategoryItem(
                    category: category,
                    onTapHandler: () {
                      handleOnCategoryTap(context, category);
                    })
            ],
          ),
        ));
  }
}
