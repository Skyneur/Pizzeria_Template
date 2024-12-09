import 'package:flutter/material.dart';
import '../models/cart.dart';
import '../models/pizza.dart';
import '../models/pizza_data.dart';
import '../ui/pizza_details.dart';
import '../share/appbar_widget.dart';

class PizzaList extends StatelessWidget {
  final Cart cart;

  PizzaList({required this.cart});

  @override
  Widget build(BuildContext context) {
    final pizzas = PizzaData.getPizzas();

    return Scaffold(
      appBar: AppBarWidget(title: 'Nos Pizzas', cart: cart),
      body: ListView.builder(
        itemCount: pizzas.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PizzaDetails(
                    pizza: pizzas[index],
                    cart: cart,
                  ),
                ),
              );
            },
            child: buildRow(context, pizzas[index]),
          );
        },
      ),
    );
  }

  Widget buildRow(BuildContext context, Pizza pizza) {
    return Card(
      margin: EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
            child: Image.asset(
              pizza.imagePath,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              pizza.name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              pizza.description,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${pizza.price.toStringAsFixed(2)} €',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.redAccent),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    cart.addPizza(pizza);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${pizza.name} ajoutée au panier !')),
                    );
                  },
                  icon: Icon(Icons.shopping_cart),
                  label: Text('Commander'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}