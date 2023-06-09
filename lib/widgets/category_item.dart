import 'package:flutter/material.dart';

import 'package:flutter_food_app/models/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key, required this.category, required this.onTapHandler});

  final Category category;
  final void Function() onTapHandler;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapHandler,
      borderRadius: BorderRadius.circular(16),
      splashColor: Theme.of(context).colorScheme.primaryContainer,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.90),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
