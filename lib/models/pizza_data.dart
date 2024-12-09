import 'pizza.dart';

class PizzaData {
  static List<Pizza> getPizzas() {
    return [
      Pizza(
        name: 'Margherita',
        description: 'Sauce tomate, mozzarella et basilic frais.',
        imagePath: 'assets/images/pizzas/margherita.png',
        price: 8.5,
      ),
      Pizza(
        name: 'Pepperoni',
        description: 'Sauce tomate, mozzarella et pepperoni.',
        imagePath: 'assets/images/pizzas/pepperoni.png',
        price: 9.5,
      ),
      Pizza(
        name: '4 Fromages',
        description: 'Mozzarella, gorgonzola, parmesan et chèvre.',
        imagePath: 'assets/images/pizzas/4fromages.png',
        price: 10.0,
      ),
    ];
  }
}