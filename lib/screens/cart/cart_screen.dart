import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/providers/shopping_list_provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool showCoupon = true;

  @override
  Widget build(BuildContext context) {
    final shoppingList = ref.watch(shoppingListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
        // actions: [],
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Column(
              children: [
                for (var elt in shoppingList)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          elt.image,
                          width: 50,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(elt.title),
                        const Spacer(),
                        Text('\$${elt.price}'),
                      ],
                    ),
                  )
              ], // output cart products here
            ),

            // output totals here
          ],
        ),
      ),
    );
  }
}
