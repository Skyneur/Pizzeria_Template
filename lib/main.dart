import 'package:flutter/material.dart';
import 'ui/pizza_list.dart'; // Importez la classe PizzaList pour la navigation
import 'models/cart.dart';
import 'share/appbar_widget.dart';
import 'dart:html' as html; // Importez le package dart:html

void main() {
  runApp(MyApp());
  html.window.console.warn('\n\nNe mettez pas n\'importe quoi comme commande dans la console navigateur.\n\n\n');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza Bella',
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold, color: Colors.red),
          bodyLarge: TextStyle(fontSize: 18.0, color: Colors.black),
        ),
      ),
      debugShowCheckedModeBanner: false, // Désactive la bannière de débogage
      home: MyHomePage(title: 'Pizza Bella'),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Commander maintenant !',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Expanded(child: MenuList(cart: cart)), // Passez le cart ici
          ],
        ),
      ),
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
    Menu(title: 'Pizzas', color: Colors.red.shade100, imagePath: 'http://localhost/static/images/home/pizzas.png'),
    Menu(title: 'Boissons', color: Colors.blue.shade100, imagePath: 'http://localhost/static/images/home/boissons.png'),
    Menu(title: 'Desserts', color: Colors.green.shade100, imagePath: 'http://localhost/static/images/home/desserts.png'),
  ];

  static final Set<String> _loadedImages = {};

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
      margin: EdgeInsets.symmetric(vertical: 10.0),
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
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
            child: Image.network(
              menu.imagePath,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                }
              },
              errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                print('Erreur de chargement de l\'image ${menu.imagePath}');
                return Icon(Icons.error);
              },
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