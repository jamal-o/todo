import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/src/feat/cart/domain/cart.dart';

final cartServiceProvider =
    NotifierProvider<CartService, Cart>(CartService.new);

class CartService extends Notifier<Cart> {
  @override
  Cart build() {
    return const Cart(
      items: [],
      status: CartStatus.PENDING,
    );
  }

  void addItem(Item item) {

    
    state = state.copyWith(items: [...state.items, item]);
  }

  Future<List<Item>> getItems() async {
    await Future.delayed(const Duration(seconds: 2));

    return const [
      Item(
        id: "Item 1",
        title: "Item 1",
        description: "Item 1 description",
        imageUrl: "https://picsum.photos/200/300",
        quantity: 0,
        price: 30,
      ),
      Item(
          id: "Item 2",
          title: "Item 2",
          description: "Item 2 description",
          imageUrl: "https://picsum.photos/200/300",
          quantity: 0,
          price: 50),
      Item(
          id: "Item 3",
          title: "Item 3",
          description: "Item 3 description",
          imageUrl: "https://picsum.photos/200/300",
          quantity: 0,
          price: 10),
    ];
  }
}
