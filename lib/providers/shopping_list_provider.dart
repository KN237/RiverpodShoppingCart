import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/models/product.dart';

class ShoppingListNotifier extends StateNotifier<Set<Product>> {
  ShoppingListNotifier()
      : super({
          const Product(
            id: '4',
            title: 'Red Backpack',
            price: 14,
            image: "assets/products/backpack.png",
          ),
        });

  toggleItem(Product p) {
    final isExisting = state.contains(p);
    if (isExisting) {
      state = state.where((elt) => elt.id != p.id).toSet();
    } else {
      state = {...state, p};
    }
  }
}

final shoppingListProvider =
    StateNotifierProvider<ShoppingListNotifier, Set<Product>>((ref) {
  return ShoppingListNotifier();
});
