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
      Pizza(
        name: 'Hawaïenne',
        description: 'La pizza Hawaïenne est une combinaison unique de saveurs sucrées et salées. Garnie de sauce tomate, de mozzarella fondue, de jambon et d\'ananas juteux, elle offre une expérience gustative exotique et rafraîchissante.',
        imagePath: 'assets/images/pizzas/hawaienne.png',
        price: 9.0,
        ingredients: ['Sauce tomate', 'Mozzarella', 'Jambon', 'Ananas'],
        allergens: ['Lait', 'Gluten'],
        nutritionValues: {
          'Calories': 280,
          'Protéines': 12,
          'Glucides': 35,
          'Lipides': 12,
        },
      ),
      Pizza(
        name: 'Végétarienne',
        description: 'La pizza Végétarienne est un choix sain et délicieux. Garnie de sauce tomate, de mozzarella, de poivrons, de champignons, d\'olives et d\'oignons rouges, elle est parfaite pour les amateurs de légumes frais et croquants.',
        imagePath: 'assets/images/pizzas/vegetarienne.png',
        price: 8.0,
        ingredients: ['Sauce tomate', 'Mozzarella', 'Poivrons', 'Champignons', 'Olives', 'Oignons rouges'],
        allergens: ['Lait'],
        nutritionValues: {
          'Calories': 240,
          'Protéines': 10,
          'Glucides': 28,
          'Lipides': 8,
        },
      ),
      Pizza(
        name: 'BBQ Chicken',
        description: 'La pizza BBQ Chicken est un régal pour les amateurs de viande. Garnie de sauce barbecue, de mozzarella, de poulet grillé, d\'oignons rouges et de coriandre fraîche, elle offre une explosion de saveurs fumées et savoureuses.',
        imagePath: 'assets/images/pizzas/bbq_chicken.png',
        price: 10.5,
        ingredients: ['Sauce barbecue', 'Mozzarella', 'Poulet grillé', 'Oignons rouges', 'Coriandre'],
        allergens: ['Lait', 'Gluten'],
        nutritionValues: {
          'Calories': 320,
          'Protéines': 15,
          'Glucides': 30,
          'Lipides': 14,
        },
      ),
      Pizza(
        name: 'Mexicaine',
        description: 'La pizza Mexicaine est une explosion de saveurs épicées. Garnie de sauce tomate, de mozzarella, de boeuf épicé, de poivrons, de maïs et de jalapeños, elle est parfaite pour les amateurs de sensations fortes.',
        imagePath: 'assets/images/pizzas/mexicaine.png',
        price: 11.0,
        ingredients: ['Sauce tomate', 'Mozzarella', 'Boeuf épicé', 'Poivrons', 'Maïs', 'Jalapeños'],
        allergens: ['Lait', 'Gluten'],
        nutritionValues: {
          'Calories': 330,
          'Protéines': 16,
          'Glucides': 34,
          'Lipides': 15,
        },
      ),
      Pizza(
        name: 'Saumon Fumé',
        description: 'La pizza Saumon Fumé est un choix raffiné et savoureux. Garnie de crème fraîche, de mozzarella, de saumon fumé, de câpres et d\'aneth, elle offre une expérience gustative délicate et gourmande.',
        imagePath: 'assets/images/pizzas/saumon_fume.png',
        price: 12.0,
        ingredients: ['Crème fraîche', 'Mozzarella', 'Saumon fumé', 'Câpres', 'Aneth'],
        allergens: ['Lait', 'Poisson'],
        nutritionValues: {
          'Calories': 290,
          'Protéines': 14,
          'Glucides': 29,
          'Lipides': 13,
        },
      ),
      Pizza(
        name: 'Tartiflette',
        description: 'La pizza Tartiflette est un hommage aux saveurs montagnardes. Garnie de crème fraîche, de mozzarella, de lardons, de pommes de terre et de reblochon, elle est parfaite pour les amateurs de plats réconfortants et généreux.',
        imagePath: 'assets/images/pizzas/tartiflette.png',
        price: 11.5,
        ingredients: ['Crème fraîche', 'Mozzarella', 'Lardons', 'Pommes de terre', 'Reblochon'],
        allergens: ['Lait', 'Gluten'],
        nutritionValues: {
          'Calories': 360,
          'Protéines': 17,
          'Glucides': 33,
          'Lipides': 18,
        },
      ),
    ];
  }
}