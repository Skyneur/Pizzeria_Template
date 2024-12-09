import 'pizza.dart';

class PizzaData {
  static List<Pizza> getPizzas() {
    return [
      Pizza(
        name: 'Margherita',
        description: 'Sauce tomate, mozzarella et basilic frais.',
        imagePath: 'assets/images/pizzas/margherita.png',
        price: 8.5,
        ingredients: ['Sauce tomate', 'Mozzarella', 'Basilic frais'],
        allergens: ['Lait'],
      ),
      Pizza(
        name: 'Pepperoni',
        description: 'Sauce tomate, mozzarella et pepperoni.',
        imagePath: 'assets/images/pizzas/pepperoni.png',
        price: 9.5,
        ingredients: ['Sauce tomate', 'Mozzarella', 'Pepperoni'],
        allergens: ['Lait', 'Gluten'],
      ),
      Pizza(
        name: '4 Fromages',
        description: 'Mozzarella, gorgonzola, parmesan et chèvre.',
        imagePath: 'assets/images/pizzas/4fromages.png',
        price: 10.0,
        ingredients: ['Mozzarella', 'Gorgonzola', 'Parmesan', 'Chèvre'],
        allergens: ['Lait'],
      ),
    ];
  }
}