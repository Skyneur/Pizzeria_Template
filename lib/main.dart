import 'package:flutter/material.dart';
import 'ui/pizza_list.dart'; // Importez la classe PizzaList pour la navigation
import 'models/cart.dart';
import 'share/appbar_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizzéria',
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false, // Désactive la bannière de débogage
      home: MyHomePage(title: 'Notre Pizzéria'),
    );
  }
}

// Page principale de l'application
class MyHomePage extends StatelessWidget {
  final String title;
  final Cart cart = Cart();

  MyHomePage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: title, cart: cart), // Assurez-vous que AppBarWidget est défini
      body: MenuList(cart: cart), // Passez le cart ici
    );
  }
}

// Modèle représentant un menu
class Menu {
  final String title;
  final Color color;
  final String imagePath;

  Menu({required this.title, required this.color, required this.imagePath});
}

// Widget affichant la liste des menus
class MenuList extends StatelessWidget {
  final Cart cart; // Ajout du cart en tant que paramètre
  MenuList({required this.cart}); // Constructeur pour recevoir cart

  final List<Menu> menus = [
    Menu(title: 'Pizzas', color: Colors.red.shade100, imagePath: 'assets/images/menus/pizzas.png'),
    Menu(title: 'Boissons', color: Colors.blue.shade100, imagePath: 'assets/images/menus/boissons.png'),
    Menu(title: 'Desserts', color: Colors.green.shade100, imagePath: 'assets/images/menus/desserts.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: menus.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            if (menus[index].title == 'Pizzas') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PizzaList(cart: cart)), // Passez le cart ici
              );
            } else {
              // Affiche un message si ce n'est pas implémenté
              showSnackBar(context, 'Fonctionnalité ${menus[index].title} à venir !');
            }
          },
          child: buildRow(menus[index]),
        );
      },
    );
  }

  // Widget pour afficher chaque élément du menu
  Widget buildRow(Menu menu) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: menu.color,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
              child: Image.asset(
                menu.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              menu.title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}