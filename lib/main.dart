import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/cart.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider<Cart>.value(
        value: Cart(),
      ),
    ], child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skillrays',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuScreen(),
      routes: {"/cart": (ctx) => CartScreen()},
    );
  }
}

class ItemTile extends StatelessWidget {
  final Item item;

  const ItemTile({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO 1: Improve item tile widget to display image and make it tappable; clicking it should add item to cart
    // Hint: Use cart objects method to add item to cart
    Cart cart = Provider.of<Cart>(context, listen: false);
    return ListTile(
        title: Text(item.name), subtitle: Text("Rs. ${item.price}"));
  }
}

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Skillrays Test"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, "/cart"),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: cart.getAllItems().length,
          itemBuilder: (BuildContext ctx, int index) {
            return ItemTile(item: cart.getAllItems()[index]);
          }),
    );
  }
}

// ToDo 2: Display List of order items in cart with their quantity
// ToDo 3: Add button to remove item from cart (Helper function already exists in cart provider)
class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
        ),
        body: cart.getCartItems().isEmpty
            ? Center(
                child: Text("No items in cart"),
              )
            : ListView.builder(itemBuilder: null));
  }
}
