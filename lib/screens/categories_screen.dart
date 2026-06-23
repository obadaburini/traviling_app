import 'package:flutter/material.dart';
import '../app_data.dart';
import '../models/trip.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Trip> availableTrips;

  const CategoriesScreen(this.availableTrips, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filteredCategories = categoriesData.where((category) {
      return availableTrips.any(
        (trip) => trip.categories.contains(category.id),
      );
    }).toList();

    return SafeArea(
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 7 / 8,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
        itemCount: filteredCategories.length,
        itemBuilder: (ctx, index) {
          final category = filteredCategories[index];

          return CategoryItem(
            id: category.id,
            title: category.title,
            imageUrl: category.imageUrl,
          );
        },
      ),
    );
  }
}
