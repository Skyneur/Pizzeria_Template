import 'pizza.dart';

class PizzaData {
  static List<Pizza> getPizzas() {
    return [
      Pizza(
        name: 'Margherita',
        description: 'La pizza Margherita est un classique intemporel. Elle est garnie de sauce tomate fraîche, de mozzarella fondante et de basilic frais, le tout sur une pâte fine et croustillante. Parfaite pour les amateurs de simplicité et de saveurs authentiques.',
        imagePath: 'assets/images/pizzas/margherita.png',
        price: 8.5,
        ingredients: ['Sauce tomate', 'Mozzarella', 'Basilic frais'],
        allergens: ['Lait'],
        nutritionValues: {
          'Calories': 250,
          'Protéines': 11,
          'Glucides': 30,
          'Lipides': 10,
        },
      ),
      Pizza(
        name: 'Pepperoni',
        description: 'La pizza Pepperoni est un choix incontournable pour les amateurs de saveurs épicées. Elle est garnie de sauce tomate savoureuse, de mozzarella fondue et de tranches généreuses de pepperoni épicé. Chaque bouchée est un mélange parfait de piquant et de fromage fondant.',
        imagePath: 'assets/images/pizzas/pepperoni.png',
        price: 9.5,
        ingredients: ['Sauce tomate', 'Mozzarella', 'Pepperoni'],
        allergens: ['Lait', 'Gluten'],
        nutritionValues: {
          'Calories': 300,
          'Protéines': 12,
          'Glucides': 32,
          'Lipides': 15,
        },
      ),
      Pizza(
        name: '4 Fromages',
        description: 'La pizza 4 Fromages est un véritable délice pour les amateurs de fromage. Elle est garnie de mozzarella crémeuse, de gorgonzola piquant, de parmesan savoureux et de chèvre fondant. Chaque bouchée est une explosion de saveurs fromagères, parfaite pour les gourmets.',
        imagePath: 'assets/images/pizzas/4fromages.png',
        price: 10.0,
        ingredients: ['Mozzarella', 'Gorgonzola', 'Parmesan', 'Chèvre'],
        allergens: ['Lait'],
        nutritionValues: {
          'Calories': 350,
          'Protéines': 14,
          'Glucides': 28,
          'Lipides': 20,
        },
      ),
    ];
  }
}