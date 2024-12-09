import 'package:flutter/material.dart';
import '../models/cart.dart';

class Panier extends StatefulWidget {
  final Cart cart;

  Panier({required this.cart});

  @override
  _PanierState createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  @override
  Widget build(BuildContext context) {
    final cart = widget.cart;

    return Scaffold(
      appBar: AppBar(
        title: Text('Votre Panier'),
      ),
      body: Column(
        children: [
          // Liste des pizzas commandées
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final item = cart.items[index];
                return ListTile(
                  title: Text(item.pizza.name),
                  subtitle: Text('Quantité: ${item.quantity}'),
                  trailing: Text('${(item.pizza.price * item.quantity).toStringAsFixed(2)} €'),
                );
              },
            ),
          ),
          // Totaux et bouton Valider
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              border: Border(top: BorderSide(color: Colors.grey)),
            ),
            child: Column(
              children: [
                Text('Total HT: ${cart.totalHT.toStringAsFixed(2)} €'),
                Text('TVA: ${cart.tva.toStringAsFixed(2)} €'),
                Text('Total TTC: ${cart.totalTTC.toStringAsFixed(2)} €'),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Commande validée !')),
                    );
                    cart.clearCart();
                    setState(() {});
                  },
                  child: Text('Valider'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
