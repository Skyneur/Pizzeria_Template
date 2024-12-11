import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/cart.dart';
import '../models/pizza.dart';
import '../models/pizza_data.dart';
import '../ui/pizza_details.dart';
import '../share/appbar_widget.dart';

class PizzaList extends StatefulWidget {
  final Cart cart;

  const PizzaList({super.key, required this.cart});

  @override
  _PizzaListState createState() => _PizzaListState();
}

class _PizzaListState extends State<PizzaList> {
  List<Pizza> pizzas = PizzaData.getPizzas();
  String searchQuery = '';
  final ScrollController _scrollController = ScrollController();
  bool _isSearchBarVisible = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        if (_isSearchBarVisible) {
          setState(() {
            _isSearchBarVisible = false;
          });
        }
      } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
        if (!_isSearchBarVisible) {
          setState(() {
            _isSearchBarVisible = true;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredPizzas = pizzas.where((pizza) {
      return pizza.name.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
    final size = MediaQuery.of(context).size;
    final crossAxisCount = size.width > 1200 ? 3 : size.width > 800 ? 2 : 1;

    return Scaffold(
      appBar: AppBarWidget(title: 'Nos Pizzas', cart: widget.cart),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500), // durée de l'animation ajustée
              height: _isSearchBarVisible ? 60.0 : 0.0,
              child: _isSearchBarVisible
                  ? TextField(
                      decoration: InputDecoration(
                        hintText: 'Rechercher une pizza...',
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.grey[300], // fond gris clair
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none, // enlever le contour
                        ),
                      ),
                      onChanged: (query) {
                        setState(() {
                          searchQuery = query;
                        });
                      },
                    )
                  : Container(),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollUpdateNotification) {
                    if (scrollNotification.scrollDelta! > 0 && _isSearchBarVisible) {
                      setState(() {
                        _isSearchBarVisible = false;
                      });
                    } else if (scrollNotification.scrollDelta! < 0 && !_isSearchBarVisible) {
                      setState(() {
                        _isSearchBarVisible = true;
                      });
                    }
                  }
                  return true;
                },
                child: GridView.builder(
                  controller: _scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: filteredPizzas.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PizzaDetails(
                              pizza: filteredPizzas[index],
                              cart: widget.cart,
                            ),
                          ),
                        );
                      },
                      child: buildRow(context, filteredPizzas[index]),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRow(BuildContext context, Pizza pizza) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
            child: Image.network(
              pizza.imagePath,
              height: 200,
              width: double.infinity,
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
                print('Failed to load image: ${pizza.imagePath}');
                print('Error: $error');
                return const Icon(Icons.error);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              pizza.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.redAccent),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    widget.cart.addPizza(pizza);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${pizza.name} ajoutée au panier !')),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart, color: Colors.white),
                  label: const Text('Commander', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent, // même couleur que le prix
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