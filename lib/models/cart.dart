import 'pizza.dart';

class CartItem {
  final Pizza pizza;
  int quantity;

  CartItem({required this.pizza, this.quantity = 1});
}

class Cart {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  // Ajouter une pizza au panier
  void addPizza(Pizza pizza) {
    final existingItem = _items.firstWhere(
      (item) => item.pizza.name == pizza.name,
      orElse: () => CartItem(pizza: pizza),
    );
    if (_items.contains(existingItem)) {
      existingItem.quantity++;
    } else {
      _items.add(existingItem);
    }
  }

  // Supprimer une pizza du panier
  void removePizza(Pizza pizza) {
    _items.removeWhere((item) => item.pizza.name == pizza.name);
  }

  // Calcul des totaux
  double get totalHT =>
      _items.fold(0, (sum, item) => sum + (item.pizza.price * item.quantity));
  double get tva => totalHT * 0.2;
  double get totalTTC => totalHT + tva;

  // Vider le panier
  void clearCart() {
    _items.clear();
  }
}