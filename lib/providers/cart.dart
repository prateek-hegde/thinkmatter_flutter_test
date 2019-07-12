import 'package:flutter/foundation.dart';

class Item {
  String id;
  String name;
  String image;
  int price;

  Item({this.id, this.name, this.image, this.price});
}

class OrderItem {
  Item item;
  int quantity;

  OrderItem({this.item, this.quantity});
}

class Cart extends ChangeNotifier {
  List<Item> _allItems = [
    Item(
        id: "100",
        name: "White Shoes",
        image:
            "https://rukminim1.flixcart.com/image/746/895/jcrz6vk0/shoe/g/w/t/ds-1503-10-d-sneakerz-white-original-imafftryhbku8nus.jpeg?q=50",
        price: 2500),
    Item(
        id: "101",
        name: "Belt",
        image:
            "https://rukminim1.flixcart.com/image/746/895/belt/c/h/k/free-size-cavblt-24-tan-cavallo-belt-cavblt-24-original-imaeksmkzf2vny7q.jpeg?q=50",
        price: 500),
    Item(
        id: "102",
        name: "Cap",
        image:
            "https://rukminim1.flixcart.com/image/880/1056/jtrjngw0/cap/z/j/h/free-brown-tag-24-babji-original-imafew5yzexzyzff.jpeg?q=50",
        price: 250),
    Item(
        id: "103",
        name: "Football",
        image:
            "https://rukminim1.flixcart.com/image/832/832/jg8ahzk0/kit/c/s/r/storm-football-ball-pump-double-action-354or-213-nivia-original-imaf42fyzzungy8e.jpeg?q=70",
        price: 400),
  ];

  List<OrderItem> _cartItems = [];

  List<Item> getAllItems() {
    return _allItems;
  }

  List<OrderItem> getCartItems() {
    return _cartItems;
  }

  void addItemToCart(Item item) {
    // Check if order already in cart; If yes increase its quantity else add to cart
    OrderItem orderItem =
        _cartItems.firstWhere((orderItem) => orderItem.item.id == item.id);
    if (orderItem != null) {
      orderItem.quantity += 1;
      notifyListeners();
    } else {
      orderItem = OrderItem(item: item, quantity: 1);
      _cartItems.add(orderItem);
      notifyListeners();
    }
  }

  void removeItemFromCart(OrderItem orderItem) {
    if (orderItem.quantity == 1) {
      _cartItems.remove(orderItem);
      notifyListeners();
    } else {
      orderItem.quantity -= 1;
      notifyListeners();
    }
  }
}
