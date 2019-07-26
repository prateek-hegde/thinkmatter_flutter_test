import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/providers/cart.dart';
import 'package:test_app/widgets/counter_action_btn.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
        ),
        body: cart.getCartItems().isEmpty
            ? Center(
                child: Text("No items in cart"),
              )
            : ListView.builder(
                itemCount: cart.getCartItems().length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      ItemTile(
                        item: cart.getCartItems()[index],
                      ),
                      Divider()
                    ],
                  );
                },
              ));
  }
}

class ItemTile extends StatelessWidget {
  final OrderItem item;

  const ItemTile({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context, listen: false);
    return ListTile(
      title: Text(item.item.name),
      subtitle: Text("Quantity: ${item.quantity}"),
      trailing: CounterActionButton(
        iconData: Icons.remove,
        onPressed: () {
          cart.removeItemFromCart(item);
        },
      ),
    );
  }
}
