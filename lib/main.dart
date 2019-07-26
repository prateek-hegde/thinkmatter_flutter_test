import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/cart/cart_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
      debugShowCheckedModeBanner: false,
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

  void _showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 15.0);
  }

  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context, listen: false);
    return ListTile(
      leading: Image.network(
        item.image,
        fit: BoxFit.cover,
        width: 40.0,
        height: 40.0,
      ),
      title: Text(item.name),
      subtitle: Text("Rs. ${item.price}"),
      onTap: () {
        cart.addItemToCart(item);
        _showToast("Item added to the cart");
      },
    );
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
          ),
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
