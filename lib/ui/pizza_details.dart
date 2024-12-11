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
  bool _showAllergens = false;
  bool _showNutritionValues = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pizza.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image de la pizza
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  widget.pizza.imagePath,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Description
            Text(
              widget.pizza.description,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 20),
            // Ingrédients
            Text(
              'Ingrédients:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.pizza.ingredients.join(', '),
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 20),
            // Allergènes
            GestureDetector(
              onTap: () {
                setState(() {
                  _showAllergens = !_showAllergens;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Allergènes:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Icon(_showAllergens ? Icons.expand_less : Icons.expand_more),
                ],
              ),
            ),
            if (_showAllergens)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  widget.pizza.allergens.join(', '),
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
              ),
            SizedBox(height: 20),
            // Valeurs nutritionnelles
            GestureDetector(
              onTap: () {
                setState(() {
                  _showNutritionValues = !_showNutritionValues;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Valeurs nutritionnelles pour 100g:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Icon(_showNutritionValues ? Icons.expand_less : Icons.expand_more),
                ],
              ),
            ),
            if (_showNutritionValues)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.pizza.nutritionValues.entries.map((entry) {
                    return Text(
                      '${entry.key}: ${entry.value}g',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    );
                  }).toList(),
                ),
              ),
            SizedBox(height: 20),
            // Bouton pour commander
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  widget.cart.addPizza(widget.pizza);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${widget.pizza.name} ajoutée au panier !')),
                  );
                },
                icon: Icon(Icons.shopping_cart),
                label: Text('Ajouter au panier'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
