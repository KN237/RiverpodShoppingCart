import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/providers/products_provider.dart';
import 'package:riverpod_files/providers/shopping_list_provider.dart';
import 'package:riverpod_files/shared/cart_icon.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Garage Sale Products'),
        actions: const [CartIcon()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: 8,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                final isExisting =
                    ref.read(shoppingListProvider).contains(products[index]);
                ref
                    .read(shoppingListProvider.notifier)
                    .toggleItem(products[index]);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: isExisting
                        ? const Text('Removed')
                        : const Text('Added'),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.blueGrey.withOpacity(0.05),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      products[index].image,
                      width: 60,
                    ),
                    Text(products[index].title),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('\$${products[index].price}'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
