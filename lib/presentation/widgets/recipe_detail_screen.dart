import 'package:flutter/material.dart';

import '../../data/models/recipe.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.label),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(recipe.image),
            const SizedBox(height: 16),
            Text(
              recipe.label,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Source: ${recipe.source}',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16)
          ],
        ),
      ),
    );
  }
}
