class Pizza {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final List<String> ingredients;
  final List<String> allergens;

  Pizza({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.ingredients,
    required this.allergens,
  });
}