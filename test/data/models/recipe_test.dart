import 'package:flutter_test/flutter_test.dart';
import 'package:recipes/data/models/recipe.dart';

void main() {
  setUp(() async {});
  group('Recipe', () {
    test('should parse the JSON', () {
      final Map<String, dynamic> json = {
        'label': 'Banana Bread',
        'image': 'http://example.com/image.jpg',
        'source': 'Source',
        'url': 'http://example.com'
      };

      final recipe = Recipe.fromJson(json);

      expect(recipe.label, 'Banana Bread');
      expect(recipe.image, 'http://example.com/image.jpg');
      expect(recipe.source, 'Source');
      expect(recipe.url, 'http://example.com');
    });

    test('It initializes with recipe values', () {
      final recipe = Recipe(
        label: 'Banana Bread',
        image: 'http://example.com/image.jpg',
        source: 'Source',
        url: 'http://example.com',
      );

      expect(recipe.label, 'Banana Bread');
      expect(recipe.image, 'http://example.com/image.jpg');
      expect(recipe.source, 'Source');
      expect(recipe.url, 'http://example.com');
    });
  });
}
