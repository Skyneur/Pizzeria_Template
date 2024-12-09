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
    final size = MediaQuery.of(context).size;
    final crossAxisCount = size.width > 1200 ? 3 : size.width > 800 ? 2 : 1;

    return Scaffold(
      appBar: AppBarWidget(title: 'Nos Pizzas', cart: cart),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.75,
        ),
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
        padding: EdgeInsets.all(10.0),
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
              pizza.description.length > 100
                  ? '${pizza.description.substring(0, 100)}...'
                  : pizza.description,
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
                  icon: Icon(Icons.shopping_cart, color: Colors.white),
                  label: Text('Commander', style: TextStyle(color: Colors.white)), // Ajoutez style: TextStyle(color: Colors.white) ici
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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