import 'package:flutter/material.dart';
import '../models/cart.dart';
import '../models/pizza.dart';

class PizzaDetails extends StatefulWidget {
  final Pizza pizza;
  final Cart cart;

  PizzaDetails({required this.pizza, required this.cart});

  @override
  _PizzaDetailsState createState() => _PizzaDetailsState();
}

class _PizzaDetailsState extends State<PizzaDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pizza.name),
      ),
      body: Column(
        children: [
          // Image de la pizza
          Image.asset(
            widget.pizza.imagePath,
            height: 200,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          // Description
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.pizza.description,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Spacer(),
          // Bouton pour commander
          ElevatedButton.icon(
            onPressed: () {
              widget.cart.addPizza(widget.pizza);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${widget.pizza.name} ajoutée au panier !')),
              );
            },
            icon: Icon(Icons.shopping_cart),
            label: Text('Ajouter au panier'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}
